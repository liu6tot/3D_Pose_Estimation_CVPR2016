function bool = feature_BD_bool_handRightUpwards(mot, varargin)

input_params = { 'threshold_vel1' , 'win_length_ms1' };

if( ~(nargin == 1 || nargin == 3) ) error('Wrong number of arguments.'); end


threshold_vel1 = 2;
win_length_ms1 = 250;
for i = 1:length(varargin);
    if(~isempty(varargin{i})) 
        eval([input_params{i} ' = varargin{i};']) ;
    end 
end 
humerus_length = sqrt(sum((mot.jointTrajectories{trajectoryID(mot,'lshoulder')}(:,1) - mot.jointTrajectories{trajectoryID(mot,'lelbow')}(:,1)).^2));

bool =  threshold_vel1* humerus_length  < feature_BD_velRelPointNormalPlane( mot, 'chest', 'neck', 'neck', 'rwrist', win_length_ms1 );