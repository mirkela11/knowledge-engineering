package model.diagnosis;

import ucm.gaia.jcolibri.cbrcore.Attribute;
import ucm.gaia.jcolibri.cbrcore.CaseComponent;

public class ProstateDescription implements CaseComponent {
    private String diagnosis;
    private String psaTest;
    private String dreTest;
    private String prostateBiopsy;
    private String cystoscopy;
    private String urodynamics;
    private String urinalysis;
    private String ultrasound;

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getPsaTest() {
        return psaTest;
    }

    public void setPsaTest(String psaTest) {
        this.psaTest = psaTest;
    }

    public String getDreTest() {
        return dreTest;
    }

    public void setDreTest(String dreTest) {
        this.dreTest = dreTest;
    }

    public String getProstateBiopsy() {
        return prostateBiopsy;
    }

    public void setProstateBiopsy(String prostateBiopsy) {
        this.prostateBiopsy = prostateBiopsy;
    }

    public String getCystoscopy() {
        return cystoscopy;
    }

    public void setCystoscopy(String cystoscopy) {
        this.cystoscopy = cystoscopy;
    }

    public String getUrodynamics() {
        return urodynamics;
    }

    public void setUrodynamics(String urodynamics) {
        this.urodynamics = urodynamics;
    }

    public String getUrinalysis() {
        return urinalysis;
    }

    public void setUrinalysis(String urinalysis) {
        this.urinalysis = urinalysis;
    }

    public String getUltrasound() {
        return ultrasound;
    }

    public void setUltrasound(String ultrasound) {
        this.ultrasound = ultrasound;
    }

    @Override
    public Attribute getIdAttribute() {
        return null;
    }

}
