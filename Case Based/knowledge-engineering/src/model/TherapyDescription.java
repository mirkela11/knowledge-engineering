package model;

import ucm.gaia.jcolibri.cbrcore.Attribute;
import ucm.gaia.jcolibri.cbrcore.CaseComponent;
import util.StringListMapper;

import java.util.List;

public class TherapyDescription implements CaseComponent {

    private String therapy;
    private List<String> diagnosis;

    public TherapyDescription() {
    }

    public TherapyDescription(String therapy, List<String> diagnosis) {
        this.therapy = therapy;
        this.diagnosis = diagnosis;
    }

    public String getTherapy() {
        return therapy;
    }

    public void setTherapy(String therapy) {
        this.therapy = therapy;
    }

    public List<String> getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(List<String> diagnosis) {
        this.diagnosis = diagnosis;
    }

    @Override
    public String toString() {
        String retVal = StringListMapper.toString(diagnosis);
        if (therapy != null && therapy.length() > 0)
            retVal += " => " + therapy;
        return retVal;
    }

    @Override
    public Attribute getIdAttribute() {
        return null;
    }


}
