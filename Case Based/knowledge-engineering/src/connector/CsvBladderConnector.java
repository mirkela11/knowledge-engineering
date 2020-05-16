package connector;

import model.diagnosis.BladderDescription;
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

public class CsvBladderConnector implements Connector {
    @Override
    public Collection<CBRCase> retrieveAllCases() {
        List<BladderDescription> bladderDescriptions = new ArrayList<>();

        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(FileIO.openFile("data/BladderDiagnosis.csv")));
            if (br == null)
                throw new Exception("Error opening file");

            String line = "";
            while ((line = br.readLine()) != null) {
                if (line.startsWith("#") || (line.length() == 0))
                    continue;
                String[] values = line.split(",");

                BladderDescription bladderDescription = new BladderDescription();
                bladderDescription.setDiagnosis(values[0]);
                bladderDescription.setUrologyExamination(values[1]);
                bladderDescription.setBladderBiopsy(values[2]);
                bladderDescription.setLiverFunctionTest(values[3]);
                bladderDescription.setBloodTestChemistry(values[4]);
                bladderDescription.setUrodynamics(values[5]);
                bladderDescription.setCystoscopy(values[6]);
                bladderDescription.setxRays(values[7]);
                bladderDescription.setUltrasound(values[8]);
                bladderDescription.setMri(values[9]);
                bladderDescription.setUrineCytology(values[10]);
                bladderDescription.setCatScan(values[11]);
                bladderDescription.setRigidCystoscopy(values[12]);

                bladderDescriptions.add(bladderDescription);
            }
            br.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        LinkedList<CBRCase> cases = new LinkedList<>();

        for (BladderDescription bd : bladderDescriptions) {
            CBRCase cbr = new CBRCase();
            cbr.setDescription(bd);
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
