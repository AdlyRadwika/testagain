class Contact {
    final String? id;
    final String? firstName;
    final String? lastName;
    final String? email;
    final String? dob;

    Contact({
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.dob,
    });

    factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        dob: json["dob"],
    );
}
