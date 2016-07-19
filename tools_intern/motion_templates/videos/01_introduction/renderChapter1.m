global VARS_GLOBAL_ANIM
if (isempty(who('VARS_GLOBAL_ANIM'))||isempty(VARS_GLOBAL_ANIM))
    VARS_GLOBAL_ANIM = emptyVarsGlobalAnimStruct;
end
VARS_GLOBAL_ANIM.video_compression = 'PNG1';

concatVideosSmooth_temporal(...
    {...
        'render/video_4cartwheels.avi',...
        'render/video_4cartwheels_sequence_slomo2.avi',...
        'render/video_4cartwheels_sequence.avi',...
    },...
    'render/1_introduction.avi',...
    {...
        [],...
        [],...        
        [],...        
    },...
    [...
        NaN,...
        0.25,...
        0.25,...
    ],...
    [...
        0 0;...
        0 0;...
        0 0;...
    ]...
    );

%'render/emptyGray640x480.tif',...        