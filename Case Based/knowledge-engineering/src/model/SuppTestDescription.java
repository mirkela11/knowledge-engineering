package model;

import util.StringListMapper;

import java.util.List;

public class SuppTestDescription {
    private String potentialDisease;
    private List<String> tests;

    public SuppTestDescription() {
    }

    public SuppTestDescription(String potentialDisease, List<String> tests) {
        this.potentialDisease = potentialDisease;
        this.tests = tests;
    }

    public String getPotentialDisease() {
        return potentialDisease;
    }

    public void setPotentialDisease(String potentialDisease) {
        this.potentialDisease = potentialDisease;
    }

    public List<String> getTests() {
        return tests;
    }

    public void setTests(List<String> tests) {
        this.tests = tests;
    }

    @Override
    public String toString() {
        String retVal = StringListMapper.toString(tests);
        if (potentialDisease != null && potentialDisease.length() > 0)
            retVal += " => " + potentialDisease;
        return retVal;
    }
}
