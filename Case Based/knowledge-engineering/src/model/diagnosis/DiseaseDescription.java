package model.diagnosis;

import ucm.gaia.jcolibri.cbrcore.Attribute;
import ucm.gaia.jcolibri.cbrcore.CaseComponent;

public class DiseaseDescription implements CaseComponent {
    private String diagnosis;
    private String urinalysis;
    private String physicalExam;
    private String bloodTestTestosteroneLevel;
    private String bloodTestLh;
    private String bloodTestProlactinLevel;
    private String bloodTestHemoglobin;

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getUrinalysis() {
        return urinalysis;
    }

    public void setUrinalysis(String urinalysis) {
        this.urinalysis = urinalysis;
    }

    public String getPhysicalExam() {
        return physicalExam;
    }

    public void setPhysicalExam(String physicalExam) {
        this.physicalExam = physicalExam;
    }

    public String getBloodTestTestosteroneLevel() {
        return bloodTestTestosteroneLevel;
    }

    public void setBloodTestTestosteroneLevel(String bloodTestTestosteroneLevel) {
        this.bloodTestTestosteroneLevel = bloodTestTestosteroneLevel;
    }

    public String getBloodTestLh() {
        return bloodTestLh;
    }

    public void setBloodTestLh(String bloodTestLh) {
        this.bloodTestLh = bloodTestLh;
    }

    public String getBloodTestProlactinLevel() {
        return bloodTestProlactinLevel;
    }

    public void setBloodTestProlactinLevel(String bloodTestProlactinLevel) {
        this.bloodTestProlactinLevel = bloodTestProlactinLevel;
    }

    public String getBloodTestHemoglobin() {
        return bloodTestHemoglobin;
    }

    public void setBloodTestHemoglobin(String bloodTestHemoglobin) {
        this.bloodTestHemoglobin = bloodTestHemoglobin;
    }

    @Override
    public Attribute getIdAttribute() {
        return null;
    }
}
