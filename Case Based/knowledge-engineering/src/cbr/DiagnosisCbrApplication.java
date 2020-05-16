package cbr;

import connector.CsvDiagnosisConnector;
import model.diagnosis.DiagnosisDescription;
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

public class DiagnosisCbrApplication implements StandardCBRApplication {

    Connector _connector;  /** Connector object */
    CBRCaseBase _caseBase;  /** CaseBase object */

    NNConfig simConfig;  /** KNN configuration */

    public void configure() throws ExecutionException {
        _connector =  new CsvDiagnosisConnector();

        _caseBase = new LinealCaseBase();  // Create a Lineal case base for in-memory organization

        simConfig = new NNConfig(); // KNN configuration
        simConfig.setDescriptionSimFunction(new Average());  // global similarity function = average

        simConfig.addMapping(new Attribute("urinalysis", DiagnosisDescription.class), new MaxString());
//        simConfig.addMapping(new Attribute("physicalExam", DiagnosisDescription.class), new MaxString());
//        simConfig.addMapping(new Attribute("bloodTestTestosteroneLevel", DiagnosisDescription.class), new MaxString());
//        simConfig.addMapping(new Attribute("bloodTestLh", DiagnosisDescription.class), new MaxString());
//        simConfig.addMapping(new Attribute("bloodTestProlactinLevel", DiagnosisDescription.class), new MaxString());

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

    public void run(String urinalysis) {
        StandardCBRApplication recommender = new DiagnosisCbrApplication();
        try {
            recommender.configure();

            recommender.preCycle();

            CBRQuery query = new CBRQuery();

            DiagnosisDescription diagnosisDescription = new DiagnosisDescription();

            diagnosisDescription.setUrinalysis(urinalysis);

            query.setDescription( diagnosisDescription );

            recommender.cycle(query);

            recommender.postCycle();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
