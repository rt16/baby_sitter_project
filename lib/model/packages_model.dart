class PackagesModel {
    PackagesModel({
        this.icon,
        this.title,
        this.subtitle,
        this.cost,
    });

    String icon;
    String title;
    String subtitle;
    String cost;

    factory PackagesModel.fromJson(Map<String, dynamic> json) => PackagesModel(
        icon: json["icon"] == null ? null : json["icon"],
        title: json["title"] == null ? null : json["title"],
        subtitle: json["subtitle"] == null ? null : json["subtitle"],
        cost: json["cost"] == null ? null : json["cost"],
    );

    Map<String, dynamic> toJson() => {
        "icon": icon == null ? null : icon,
        "title": title == null ? null : title,
        "subtitle": subtitle == null ? null : subtitle,
        "cost": cost == null ? null : cost,
    };
}
