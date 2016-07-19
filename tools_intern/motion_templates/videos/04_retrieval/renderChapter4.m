global VARS_GLOBAL_ANIM
if (isempty(who('VARS_GLOBAL_ANIM'))||isempty(VARS_GLOBAL_ANIM))
    VARS_GLOBAL_ANIM = emptyVarsGlobalAnimStruct;
end
VARS_GLOBAL_ANIM.video_compression = 'PNG1';

concatVideosSmooth_temporal(...
    {...
        'render/video_template_cartwheel_allfeatures_real.avi',...
        'render/video_template_cartwheel_allfeatures_bool.avi',...
        'render/video_cartwheel_mix_final.avi',...
        'render/video_template_jumpingJack_allfeatures_bool.avi',...
        'render/video_jumpingJack_combined.avi',...
        'render/video_template_elbowToKnee_allfeatures_bool.avi',...
        'render/video_elbowToKnee_combined.avi',...
        'render/video_hits_lieDownFloor_002_overlay.avi',...
        'render/video_hits_lieDownFloor_006_overlay.avi',...
        'render/video_hits_clapAboveHead_001_overlay.avi',...
        'render/video_hits_clapAboveHead_004_overlay.avi',...
        'render/video_hits_throwBasketball_002_overlay.avi',...
        'render/video_hits_throwBasketball_004_overlay.avi',...
        'render/video_slide_performance_table.avi',...
    },...
    'render/04_retrieval2.avi',...
    {...
        [],...
        [],...        
        [],...        
        [],...        
        [],...        
        [],...        
       'render/emptyGray640x480.tif',...        
        [],...        
        [],...        
        [],...        
        [],...        
        [],...        
       'render/emptyGray640x480.tif',...        
       'render/emptyGray640x480.tif',...        
    },...
    [...
        NaN,...
        0.25,...
        0.25,...
        0.25,...
        0.25,...
        0.25,...
        0.25,...
        0.25,...
        0.25,...
        0.25,...
        0.25,...
        0.25,...
        0.25,...
        0.25,...
    ],...
    [...
        30 0;...
        0 0;...
        15 0;...
        0 0;...
        0 0;...
        0 0;...
        0 0;...
        0 0;...
        0 0;...
        0 0;...
        0 0;...
        0 0;...
        0 0;...
        0 0;...
    ]...
    );

%'render/emptyGray640x480.tif',...        