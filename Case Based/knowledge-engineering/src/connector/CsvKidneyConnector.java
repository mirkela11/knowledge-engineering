package connector;

import model.diagnosis.KidneyDescription;
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

public class CsvKidneyConnector implements Connector {

    @Override
    public Collection<CBRCase> retrieveAllCases() {
        List<KidneyDescription> kidneyDescriptions = new ArrayList<>();

        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(FileIO.openFile("data/KidneyDiagnosis.csv")));
            if (br == null)
                throw new Exception("Error opening file");

            String line = "";
            while ((line = br.readLine()) != null) {
                if (line.startsWith("#") || (line.length() == 0))
                    continue;
                String[] values = line.split(",");

                KidneyDescription kidneyDescription = new KidneyDescription();
                kidneyDescription.setDiagnosis(values[0]);
                kidneyDescription.setCatScan(values[1]);
                kidneyDescription.setKidneyBiopsy(values[2]);
                kidneyDescription.setUrinalysis(values[3]);
                kidneyDescription.setLiverFunctionTest(values[4]);
                kidneyDescription.setIvp(values[5]);
                kidneyDescription.setUltrasound(values[6]);
                kidneyDescription.setMri(values[7]);
                kidneyDescription.setBloodTestChemistry(values[8]);

                kidneyDescriptions.add(kidneyDescription);
            }
            br.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        LinkedList<CBRCase> cases = new LinkedList<>();

        for (KidneyDescription kd : kidneyDescriptions) {
            CBRCase cbr = new CBRCase();
            cbr.setDescription(kd);
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
