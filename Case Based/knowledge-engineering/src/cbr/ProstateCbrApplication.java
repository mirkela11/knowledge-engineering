package cbr;

import connector.CsvProstateConnector;
import model.diagnosis.ProstateDescription;
import ucm.gaia.jcolibri.casebase.LinealCaseBase;
import ucm.gaia.jcolibri.cbraplications.StandardCBRApplication;
import ucm.gaia.jcolibri.cbrcore.*;
import ucm.gaia.jcolibri.exception.ExecutionException;
import ucm.gaia.jcolibri.method.retrieve.NNretrieval.NNConfig;
import ucm.gaia.jcolibri.method.retrieve.NNretrieval.NNScoringMethod;
import ucm.gaia.jcolibri.method.retrieve.NNretrieval.similarity.global.Average;
import ucm.gaia.jcolibri.method.retrieve.NNretrieval.similarity.local.MaxString;
import ucm.gaia.jcolibri.method.retrieve.RetrievalResult;
import ucm.gaia.jcolibri.method.retrieve.selection.SelectCases;

import java.util.Collection;

public class ProstateCbrApplication implements StandardCBRApplication {
    Connector _connector;  /** Connector object */
    CBRCaseBase _caseBase;  /** CaseBase object */

    NNConfig simConfig;  /** KNN configuration */

    public void configure() throws ExecutionException {
        _connector =  new CsvProstateConnector();

        _caseBase = new LinealCaseBase();  // Create a Lineal case base for in-memory organization

        simConfig = new NNConfig(); // KNN configuration
        simConfig.setDescriptionSimFunction(new Average());  // global similarity function = average
        simConfig.addMapping(new Attribute("psaTest", ProstateDescription.class), new MaxString());
        simConfig.addMapping(new Attribute("dreTest", ProstateDescription.class), new MaxString());
//        simConfig.addMapping(new Attribute("prostateBiopsy", ProstateDescription.class), new MaxString());
//        simConfig.addMapping(new Attribute("cystoscopy", ProstateDescription.class), new MaxString());
//        simConfig.addMapping(new Attribute("urodynamics", ProstateDescription.class), new MaxString());
//        simConfig.addMapping(new Attribute("urinalysis", ProstateDescription.class), new MaxString());
//        simConfig.addMapping(new Attribute("ultrasound", ProstateDescription.class), new MaxString());
//        simConfig.addMapping(new Attribute("ctScan", ProstateDescription.class), new MaxString());

        // simConfig.addMapping(new Attribute("attribute", CaseDescription.class), new Interval(5));
}

    public void cycle(CBRQuery query) throws ExecutionException {
        Collection<RetrievalResult> eval = NNScoringMethod.evaluateSimilarity(_caseBase.getCases(), query, simConfig);
        eval = SelectCases.selectTopKRR(eval, 5);
        System.out.println("Retrieved cases:");
        for (RetrievalResult nse : eval)
            System.out.println(nse.get_case().getDescription() + " -> " + nse.getEval());
    }

    public void postCycle() throws ExecutionException {

    }

    public CBRCaseBase preCycle() throws ExecutionException {
        _caseBase.init(_connector);
        Collection<CBRCase> cases = _caseBase.getCases();
        for (CBRCase c: cases)
            System.out.println(c.getDescription());
        return _caseBase;
    }

    public void run(String psa, String dre) {
        StandardCBRApplication recommender = new ProstateCbrApplication();
        try {
            recommender.configure();

            recommender.preCycle();

            CBRQuery query = new CBRQuery();

            ProstateDescription prostateDescription = new ProstateDescription();

            prostateDescription.setDreTest(dre);
            prostateDescription.setPsaTest(psa);

            query.setDescription( prostateDescription );

            recommender.cycle(query);

            recommender.postCycle();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
