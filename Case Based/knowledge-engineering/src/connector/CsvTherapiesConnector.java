package connector;

import model.TherapyDescription;
import ucm.gaia.jcolibri.cbrcore.CBRCase;
import ucm.gaia.jcolibri.cbrcore.CaseBaseFilter;
import ucm.gaia.jcolibri.cbrcore.Connector;
import ucm.gaia.jcolibri.exception.InitializingException;
import ucm.gaia.jcolibri.util.FileIO;
import util.StringListMapper;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class CsvTherapiesConnector implements Connector {

    @Override
    public Collection<CBRCase> retrieveAllCases() {
        List<TherapyDescription> therapyDescriptions = new ArrayList<>();

        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(FileIO.openFile("data/Therapies.csv")));
            if (br == null)
                throw new Exception("Error opening file");

            String line = "";
            while ((line = br.readLine()) != null) {
                if (line.startsWith("#") || (line.length() == 0))
                    continue;
                String[] values = line.split(";");

                TherapyDescription therapyDescription = new TherapyDescription();
                therapyDescription.setTherapy(values[0]);
                therapyDescription.setDiagnosis(StringListMapper.toList(values[1]));

                therapyDescriptions.add(therapyDescription);
            }
            br.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        LinkedList<CBRCase> cases = new LinkedList<>();

        for (TherapyDescription td : therapyDescriptions) {
            CBRCase cbr = new CBRCase();
            cbr.setDescription(td);
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
