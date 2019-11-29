repetition_phrase = "repetitions";

exercises = [
    ["Squats", ""],
    ["Sit ups", ""],
    ["Pushups", "on fists"],
];

for (i = [0:26:130]) {
    for (j = [0:51:153]) {
        count = floor(rands(5, 16, 1)[0]);
        exercise = rands(0, len(exercises), 1)[0];
        translate([j, i, 0]) cal_entry(count, exercises[exercise]);
    }
}

module t(t, s = 18, style = "") {
    translate([0,0,0.25]) linear_extrude(height = 1.75)
        text(t, size = s, font = "Liberation Sans:style=Bold", $fn = 16, halign = "center");
}

module black() color([0, 0, 0]) children();

module cal_entry(count, exercise) {
    translate([25, 12.5, 0.25]) {
        cube([50, 25, 0.5], center = true);
        translate([0,  5, 0]) black() t(str(count, " ", repetition_phrase), 4);
        translate([0, -2, 0]) black() t(exercise[0], 4);
        translate([0, -7, 0]) black() t(exercise[1], 4);
    }
}
