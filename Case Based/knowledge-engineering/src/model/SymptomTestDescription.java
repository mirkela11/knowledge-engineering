package model;

import ucm.gaia.jcolibri.cbrcore.Attribute;
import ucm.gaia.jcolibri.cbrcore.CaseComponent;
import util.StringListMapper;

import java.util.List;

public class SymptomTestDescription implements CaseComponent {
    private String test;
    private List<String> symptoms;

    public SymptomTestDescription() {
    }

    public SymptomTestDescription(String test, List<String> symptoms) {
        this.test = test;
        this.symptoms = symptoms;
    }

    public String getTest() {
        return test;
    }

    public void setTest(String test) {
        this.test = test;
    }

    public List<String> getSymptoms() {
        return symptoms;
    }

    public void setSymptoms(List<String> symptoms) {
        this.symptoms = symptoms;
    }

    @Override
    public Attribute getIdAttribute() {
        return null;
    }

    @Override
    public String toString() {
        String retVal = StringListMapper.toString(symptoms);
        if (test != null && test.length() > 0)
            retVal += " => " + test;
        return retVal;
    }
}
