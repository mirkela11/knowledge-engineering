package connector;

import model.diagnosis.ProstateDescription;
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

public class CsvProstateConnector implements Connector {

    @Override
    public Collection<CBRCase> retrieveAllCases() {
        List<ProstateDescription> prostateDescriptions = new ArrayList<>();

        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(FileIO.openFile("data/ProstateDiagnosis.csv")));
            if (br == null)
                throw new Exception("Error opening file");

            String line = "";
            while ((line = br.readLine()) != null) {
                if (line.startsWith("#") || (line.length() == 0))
                    continue;
                String[] values = line.split(",");

                ProstateDescription prostateDescription = new ProstateDescription();
                prostateDescription.setDiagnosis(values[0]);
                prostateDescription.setPsaTest(values[1]);
                prostateDescription.setDreTest(values[2]);
                prostateDescription.setProstateBiopsy(values[3]);
                prostateDescription.setCystoscopy(values[4]);
                prostateDescription.setUrodynamics(values[5]);
                prostateDescription.setUrinalysis(values[6]);
                prostateDescription.setUltrasound(values[7]);
                prostateDescription.setCtScan(values[8]);

                prostateDescriptions.add(prostateDescription);
            }
            br.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        LinkedList<CBRCase> cases = new LinkedList<>();

        for (ProstateDescription pd : prostateDescriptions) {
            CBRCase cbr = new CBRCase();
            cbr.setDescription(pd);
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
