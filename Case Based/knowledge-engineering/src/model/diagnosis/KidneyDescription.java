package model.diagnosis;

import ucm.gaia.jcolibri.cbrcore.Attribute;
import ucm.gaia.jcolibri.cbrcore.CaseComponent;

public class KidneyDescription implements CaseComponent {
    private String diagnosis;
    private String catScan;
    private String kidneyBiopsy;
    private String urinalysis;
    private String liverFunctionTest;
    private String ivp;
    private String ultrasound;
    private String mri;
    private String physicalExam;
    private String bloodTestChemistry;
    private String xRays;

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getCatScan() {
        return catScan;
    }

    public void setCatScan(String catScan) {
        this.catScan = catScan;
    }

    public String getKidneyBiopsy() {
        return kidneyBiopsy;
    }

    public void setKidneyBiopsy(String kidneyBiopsy) {
        this.kidneyBiopsy = kidneyBiopsy;
    }

    public String getUrinalysis() {
        return urinalysis;
    }

    public void setUrinalysis(String urinalysis) {
        this.urinalysis = urinalysis;
    }

    public String getLiverFunctionTest() {
        return liverFunctionTest;
    }

    public void setLiverFunctionTest(String liverFunctionTest) {
        this.liverFunctionTest = liverFunctionTest;
    }

    public String getIvp() {
        return ivp;
    }

    public void setIvp(String ivp) {
        this.ivp = ivp;
    }

    public String getUltrasound() {
        return ultrasound;
    }

    public void setUltrasound(String ultrasound) {
        this.ultrasound = ultrasound;
    }

    public String getMri() {
        return mri;
    }

    public void setMri(String mri) {
        this.mri = mri;
    }

    public String getPhysicalExam() {
        return physicalExam;
    }

    public void setPhysicalExam(String physicalExam) {
        this.physicalExam = physicalExam;
    }

    public String getBloodTestChemistry() {
        return bloodTestChemistry;
    }

    public void setBloodTestChemistry(String bloodTestChemistry) {
        this.bloodTestChemistry = bloodTestChemistry;
    }

    public String getxRays() {
        return xRays;
    }

    public void setxRays(String xRays) {
        this.xRays = xRays;
    }

    @Override
    public Attribute getIdAttribute() {
        return null;
    }

    @Override
    public String toString() {
        return diagnosis;
    }
}
