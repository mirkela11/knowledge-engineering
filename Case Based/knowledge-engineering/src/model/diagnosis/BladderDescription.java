package model.diagnosis;

import ucm.gaia.jcolibri.cbrcore.Attribute;
import ucm.gaia.jcolibri.cbrcore.CaseComponent;

public class BladderDescription implements CaseComponent {
    private String diagnosis;
    private String urologyExamination;
    private String bladderBiopsy;
    private String liverFunctionTest;
    private String ivp;
    private String physicalExam;
    private String bloodTestChemistry;
    private String urodynamics;
    private String cystoscopy;
    private String xRays;
    private String ultrasound;
    private String mri;
    private String urineCytology;
    private String catScan;
    private String rigidCystoscopy;

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getUrologyExamination() {
        return urologyExamination;
    }

    public void setUrologyExamination(String urologyExamination) {
        this.urologyExamination = urologyExamination;
    }

    public String getBladderBiopsy() {
        return bladderBiopsy;
    }

    public void setBladderBiopsy(String bladderBiopsy) {
        this.bladderBiopsy = bladderBiopsy;
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

    public String getUrodynamics() {
        return urodynamics;
    }

    public void setUrodynamics(String urodynamics) {
        this.urodynamics = urodynamics;
    }

    public String getCystoscopy() {
        return cystoscopy;
    }

    public void setCystoscopy(String cystoscopy) {
        this.cystoscopy = cystoscopy;
    }

    public String getxRays() {
        return xRays;
    }

    public void setxRays(String xRays) {
        this.xRays = xRays;
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

    public String getUrineCytology() {
        return urineCytology;
    }

    public void setUrineCytology(String urineCytology) {
        this.urineCytology = urineCytology;
    }

    public String getCatScan() {
        return catScan;
    }

    public void setCatScan(String catScan) {
        this.catScan = catScan;
    }

    public String getRigidCystoscopy() {
        return rigidCystoscopy;
    }

    public void setRigidCystoscopy(String rigidCystoscopy) {
        this.rigidCystoscopy = rigidCystoscopy;
    }

    @Override
    public Attribute getIdAttribute() {
        return null;
    }
}
