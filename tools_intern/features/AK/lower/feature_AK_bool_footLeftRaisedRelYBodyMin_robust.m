function feature = feature_AK_bool_footLeftRaisedRelYBodyMin_robust(mot)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f1 = feature_AK_bool_footLeftRaisedRelYBodyMin(mot,1);
f2 = feature_AK_bool_footLeftRaisedRelYBodyMin(mot,1.2);

feature = features_combine_robust(f1,f2);
