package connector;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import model.SuppTestDescription;
import model.SymptomDescription;
import model.SymptomTestDescription;
import ucm.gaia.jcolibri.cbrcore.CBRCase;
import ucm.gaia.jcolibri.cbrcore.CaseBaseFilter;
import ucm.gaia.jcolibri.cbrcore.Connector;
import ucm.gaia.jcolibri.exception.InitializingException;
import ucm.gaia.jcolibri.util.FileIO;
import util.StringListMapper;

public class CsvSymptomTestConnector implements Connector {

    @Override
    public Collection<CBRCase> retrieveAllCases() {
        List<SymptomDescription> symptomDescriptions = new ArrayList<>();
        List<SuppTestDescription> suppTestDescriptions = new ArrayList<>();

        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(FileIO.openFile("data/Symptoms.csv")));
            if (br == null)
                throw new Exception("Error opening file");

            String line = "";
            while ((line = br.readLine()) != null) {
                if (line.startsWith("#") || (line.length() == 0))
                    continue;
                String[] values = line.split(";");

                SymptomDescription stDescription = new SymptomDescription();
                stDescription.setPotentialDisease(values[0]);
                stDescription.setSymptoms(StringListMapper.toList(values[1]));

                symptomDescriptions.add(stDescription);
            }
            br.close();

            br = new BufferedReader(new InputStreamReader(FileIO.openFile("data/SupplementaryTests.csv")));
            if (br == null)
                throw new Exception("Error opening file");

            while ((line = br.readLine()) != null) {
                if (line.startsWith("#") || (line.length() == 0))
                    continue;
                String[] values = line.split(";");

                SuppTestDescription stDescription = new SuppTestDescription();
                stDescription.setPotentialDisease(values[0]);
                stDescription.setTests(StringListMapper.toList(values[1]));

                suppTestDescriptions.add(stDescription);
            }
            br.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        LinkedList<CBRCase> cases = new LinkedList<>();

        for (SuppTestDescription st : suppTestDescriptions) {
            for (SymptomDescription s : symptomDescriptions) {
                if (st.getPotentialDisease().equals(s.getPotentialDisease())) {
                    for (String test : st.getTests()) {
                        CBRCase cbr = new CBRCase();
                        cbr.setDescription(new SymptomTestDescription(test, s.getSymptoms()));
                        cases.add(cbr);
                    }
                }
            }
        }

        return cases;
    }

    @Override
    public Collection<CBRCase> retrieveSomeCases(CaseBaseFilter arg0) {
        return null;
    }

    @Override
    public void storeCases(Collection<CBRCase> arg0) {
    }

    @Override
    public void close() {
    }

    @Override
    public void deleteCases(Collection<CBRCase> arg0) {
    }

    @Override
    public void initFromXMLfile(URL arg0) throws InitializingException {
    }

}