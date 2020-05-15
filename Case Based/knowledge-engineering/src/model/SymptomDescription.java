package model;

import ucm.gaia.jcolibri.cbrcore.Attribute;
import util.StringListMapper;

import java.util.List;

public class SymptomDescription {

    private String potentialDisease;
    private List<String> symptoms;

    public SymptomDescription() {
    }

    public SymptomDescription(String potentialDisease, List<String> symptoms) {
        this.potentialDisease = potentialDisease;
        this.symptoms = symptoms;
    }

    public String getPotentialDisease() {
        return potentialDisease;
    }

    public void setPotentialDisease(String potentialDisease) {
        this.potentialDisease = potentialDisease;
    }

    public List<String> getSymptoms() {
        return symptoms;
    }

    public void setSymptoms(List<String> symptoms) {
        this.symptoms = symptoms;
    }

    @Override
    public String toString() {
        String retVal = StringListMapper.toString(symptoms);
        if (potentialDisease != null && potentialDisease.length() > 0)
            retVal += " => " + potentialDisease;
        return retVal;
    }
}
