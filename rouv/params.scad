
DOME_DIA = 100;
DOME_THICK = 2.0;
ORING_DIA = 5.0;
PROP_SHROUD_DIA = 50;
PROP_SHROUD_THICK = 2.5;
//BASE_PLATE_BOLT = 3.5;
BASE_PLATE_BOLT = 2.2;
//BASE_PLATE_BOLT = 0;
CHAMBER_THICK = 5.0;
THREAD_MALE_THICK = 4.0;
THREAD_FEMALE_THICK = 2.0;
CHAMBER_DIA=(DOME_DIA/2+ORING_DIA+CHAMBER_THICK+THREAD_MALE_THICK+THREAD_FEMALE_THICK)*2;
SHELL_MARGIN = 0.2;
SHELL_THICK= 1.8;

function r_from_dia(d) = d / 2;