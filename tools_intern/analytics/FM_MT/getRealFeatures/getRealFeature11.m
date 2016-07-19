function [ scale, dataReal, thresh1, thresh2, dataBool ] = getRealFeature11( mot )

scale = true;
threshold_vel1 = 1.2;
threshold_vel2 = 1.4;

humerus_length = sqrt(sum((mot.jointTrajectories{trajectoryID(mot,'relbow')}(:,1) - mot.jointTrajectories{trajectoryID(mot,'rshoulder')}(:,1)).^2));

dataReal = feature_velRelPointNormalPlane(mot,'rwrist','root','rwrist','root');
% dataReal = feature_velRelPointNormalPlane(mot,'rwrist','root','root','rwrist');
thresh1 = threshold_vel1 * humerus_length;
thresh2 = threshold_vel2 * humerus_length;

if nargout > 4
    dataBool = feature_AK_bool_handRightMoveApartRelRoot_robust(mot);
end