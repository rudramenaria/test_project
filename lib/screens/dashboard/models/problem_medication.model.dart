class ProblemMedicationModel {
    ProblemMedicationModel({
        this.problems,
    });

    List<Problem>? problems;

    factory ProblemMedicationModel.fromJson(Map<String, dynamic> json) => ProblemMedicationModel(
        problems: List<Problem>.from(json["problems"].map((x) => Problem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "problems": List<dynamic>.from(problems!.map((x) => x.toJson())),
    };
}

class Problem {
    Problem({
        this.diabetes,
    });

    List<Diabetes>? diabetes;

    factory Problem.fromJson(Map<String, dynamic> json) => Problem(
        diabetes: List<Diabetes>.from(json["Diabetes"].map((x) => Diabetes.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Diabetes": List<dynamic>.from(diabetes!.map((x) => x.toJson())),
    };
}

class Diabetes {
    Diabetes({
        this.medications,
        this.labs,
    });

    List<Medication>? medications;
    List<Lab>? labs;

    factory Diabetes.fromJson(Map<String, dynamic> json) => Diabetes(
        medications: List<Medication>.from(json["medications"].map((x) => Medication.fromJson(x))),
        labs: List<Lab>.from(json["labs"].map((x) => Lab.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "medications": List<dynamic>.from(medications!.map((x) => x.toJson())),
        "labs": List<dynamic>.from(labs!.map((x) => x.toJson())),
    };
}

class Lab {
    Lab({
        this.missingField,
    });

    String? missingField;

    factory Lab.fromJson(Map<String, dynamic> json) => Lab(
        missingField: json["missing_field"],
    );

    Map<String, dynamic> toJson() => {
        "missing_field": missingField,
    };
}

class Medication {
    Medication({
        this.medicationsClasses,
    });

    List<MedicationsClass>? medicationsClasses;

    factory Medication.fromJson(Map<String, dynamic> json) => Medication(
        medicationsClasses: List<MedicationsClass>.from(json["medicationsClasses"].map((x) => MedicationsClass.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "medicationsClasses": List<dynamic>.from(medicationsClasses!.map((x) => x.toJson())),
    };
}

class MedicationsClass {
    MedicationsClass({
        this.className,
        this.className2,
    });

    List<ClassName>? className;
    List<ClassName>? className2;

    factory MedicationsClass.fromJson(Map<String, dynamic> json) => MedicationsClass(
        className: List<ClassName>.from(json["className"].map((x) => ClassName.fromJson(x))),
        className2: List<ClassName>.from(json["className2"].map((x) => ClassName.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "className": List<dynamic>.from(className!.map((x) => x.toJson())),
        "className2": List<dynamic>.from(className2!.map((x) => x.toJson())),
    };
}

class ClassName {
    ClassName({
        this.associatedDrug,
        this.associatedDrug2,
    });

    List<AssociatedDrug>? associatedDrug;
    List<AssociatedDrug>? associatedDrug2;

    factory ClassName.fromJson(Map<String, dynamic> json) => ClassName(
        associatedDrug: json["associatedDrug"] ==null ? null : List<AssociatedDrug>.from(json["associatedDrug"].map((x) => AssociatedDrug.fromJson(x))),
        associatedDrug2: json["associatedDrug#2"]==null ? null : List<AssociatedDrug>.from(json["associatedDrug#2"].map((x) => AssociatedDrug.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "associatedDrug": associatedDrug ==null ? null : List<dynamic>.from(associatedDrug!.map((x) => x.toJson())),
        "associatedDrug#2": associatedDrug2 ==null ? null : List<dynamic>.from(associatedDrug2!.map((x) => x.toJson())),
    };
}

class AssociatedDrug {
    AssociatedDrug({
        this.name,
        this.dose,
        this.strength,
    });

    String? name;
    String? dose;
    String? strength;

    factory AssociatedDrug.fromJson(Map<String, dynamic> json) => AssociatedDrug(
        name: json["name"],
        dose: json["dose"],
        strength: json["strength"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "dose": dose,
        "strength": strength,
    };
}
