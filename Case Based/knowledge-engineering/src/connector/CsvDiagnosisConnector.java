package connector;

import model.diagnosis.DiagnosisDescription;
import ucm.gaia.jcolibri.cbrcore.CBRCase;
import ucm.gaia.jcolibri.cbrcore.CaseBaseFilter;
import ucm.gaia.jcolibri.cbrcore.Connector;
import ucm.gaia.jcolibri.exception.InitializingException;
import ucm.gaia.jcolibri.util.FileIO;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class CsvDiagnosisConnector implements Connector {

    @Override
    public Collection<CBRCase> retrieveAllCases() {
        List<DiagnosisDescription> diagnosisDescriptions = new ArrayList<>();

        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(FileIO.openFile("data/Diagnosis.csv")));
            if (br == null)
                throw new Exception("Error opening file");

            String line = "";
            while ((line = br.readLine()) != null) {
                if (line.startsWith("#") || (line.length() == 0))
                    continue;
                String[] values = line.split(",");

                DiagnosisDescription diagnosisDescription = new DiagnosisDescription();
                diagnosisDescription.setDiagnosis(values[0]);
                diagnosisDescription.setUrinalysis(values[1]);
                diagnosisDescription.setPhysicalExam(values[2]);
                diagnosisDescription.setBloodTestTestosteroneLevel(values[3]);
                diagnosisDescription.setBloodTestLh(values[4]);
                diagnosisDescription.setBloodTestProlactinLevel(values[5]);

                diagnosisDescriptions.add(diagnosisDescription);
            }
            br.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        LinkedList<CBRCase> cases = new LinkedList<>();

        for (DiagnosisDescription dd : diagnosisDescriptions) {
            CBRCase cbr = new CBRCase();
            cbr.setDescription(dd);
            cases.add(cbr);
        }


        return cases;
    }


    @Override
    public void initFromXMLfile(URL url) throws InitializingException {

    }

    @Override
    public void close() {

    }

    @Override
    public void storeCases(Collection<CBRCase> collection) {

    }

    @Override
    public void deleteCases(Collection<CBRCase> collection) {

    }

    @Override
    public Collection<CBRCase> retrieveSomeCases(CaseBaseFilter caseBaseFilter) {
        return null;
    }
}
