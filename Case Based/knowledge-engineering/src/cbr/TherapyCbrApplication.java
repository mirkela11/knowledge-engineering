package cbr;

import connector.CsvTherapiesConnector;
import model.TherapyDescription;
import similarity.ListTableSimilarity;
import ucm.gaia.jcolibri.casebase.LinealCaseBase;
import ucm.gaia.jcolibri.cbraplications.StandardCBRApplication;
import ucm.gaia.jcolibri.cbrcore.*;
import ucm.gaia.jcolibri.exception.ExecutionException;
import ucm.gaia.jcolibri.method.retrieve.NNretrieval.NNConfig;
import ucm.gaia.jcolibri.method.retrieve.NNretrieval.NNScoringMethod;
import ucm.gaia.jcolibri.method.retrieve.NNretrieval.similarity.global.Average;
import ucm.gaia.jcolibri.method.retrieve.RetrievalResult;
import ucm.gaia.jcolibri.method.retrieve.selection.SelectCases;

import java.util.*;

public class TherapyCbrApplication implements StandardCBRApplication {

    Connector _connector;
    /**
     * Connector object
     */
    CBRCaseBase _caseBase;
    /**
     * CaseBase object
     */

    NNConfig simConfig;

    /**
     * KNN configuration
     */

    @Override
    public void configure() throws ExecutionException {

        _connector = new CsvTherapiesConnector();

        _caseBase = new LinealCaseBase();  // Create a Lineal case base for in-memory organization

        simConfig = new NNConfig(); // KNN configuration
        simConfig.setDescriptionSimFunction(new Average());  // global similarity function = average

        // simConfig.addMapping(new Attribute("attribute", CaseDescription.class), new Interval(5));

        simConfig.addMapping(new Attribute("diagnosis", TherapyDescription.class), new ListTableSimilarity());

    }

    @Override
    public CBRCaseBase preCycle() throws ExecutionException {
        _caseBase.init(_connector);
        Collection<CBRCase> cases = _caseBase.getCases();
        for (CBRCase c : cases)
            System.out.println(c.getDescription());
        return _caseBase;
    }

    @Override
    public void cycle(CBRQuery cbrQuery) throws ExecutionException {

        Collection<RetrievalResult> eval = NNScoringMethod.evaluateSimilarity(_caseBase.getCases(), cbrQuery, simConfig);
        eval = SelectCases.selectTopKRR(eval, 20);
        System.out.println("Retrieved cases:");
        HashMap<String, RetrievalResult> finalResults = new HashMap<>();
        for (RetrievalResult nse : eval) {
            String caseComp = nse.get_case().getDescription().toString();
            String[] split = caseComp.split("=>");

            if (finalResults.containsKey(split[1]))
                continue;
            else
                finalResults.put(split[1], nse);

        }

        for (Map.Entry<String,RetrievalResult> entry : finalResults.entrySet())
            System.out.println(entry.getValue().get_case().getDescription() + " -> " + entry.getValue().getEval()*100+"%");




    }

    @Override
    public void postCycle() throws ExecutionException {


    }

    public void run(List<String> diagnosis) {
        StandardCBRApplication recommender = new TherapyCbrApplication();
        try {
            recommender.configure();

            recommender.preCycle();

            CBRQuery query = new CBRQuery();

            TherapyDescription therapyDescription = new TherapyDescription();

            therapyDescription.setDiagnosis(diagnosis);

            query.setDescription(therapyDescription);

            recommender.cycle(query);

            recommender.postCycle();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
