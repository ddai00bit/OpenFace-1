clear

load('./results/results_clnf_wild.mat');

[clnf_error, ~,~,frontal_ids] = compute_error_small( experiment.labels,  experiment.shapes-1.0);
clnf_error_frontal = clnf_error(frontal_ids);
clnf_error_profile = clnf_error(~frontal_ids);

load('./results/results_ceclm_general.mat');

[ceclm_error,~,~,frontal_ids] = compute_error_small( experiment.labels,  experiment.shapes-1.0);
ceclm_error_frontal = ceclm_error(frontal_ids);
ceclm_error_profile = ceclm_error(~frontal_ids);
labels = experiment.labels;

load('results/CFAN_JANUS.mat');

[cfan_error,~,~,frontal_ids] = compute_error_small( labels_all,  shapes_all-1.0);
cfan_error_frontal = cfan_error(frontal_ids);
cfan_error_profile = cfan_error(~frontal_ids);

load('results/JANUS_3DDFA.mat');

[error_3ddfa,~,~,frontal_ids] = compute_error_small( labels_all,  shapes-1.0);
error_3ddfa_frontal = error_3ddfa(frontal_ids);
error_3ddfa_profile = error_3ddfa(~frontal_ids);

load('results/JANUS_pocr.mat');

[pocr_error,~,~,frontal_ids] = compute_error_small( labels,  experiments.shapes-0.5);
pocr_error_frontal = pocr_error(frontal_ids);
pocr_error_profile = pocr_error(~frontal_ids);

load('results/JANUS_chehra.mat');

[drmf_error,~,~,frontal_ids] = compute_error_small( labels,  shapes);
drmf_error_frontal = drmf_error(frontal_ids);
drmf_error_profile = drmf_error(~frontal_ids);

load('results/JANUS_sdm.mat');

[sdm_error,~,~,frontal_ids] = compute_error_small( labels,  experiments.shapes);
sdm_error_frontal = sdm_error(frontal_ids);
sdm_error_profile = sdm_error(~frontal_ids);

load('results/JANUS-CFSS.mat');
shapes = zeros(68,2, size(estimatedPose,1));

for i = 1:size(shapes, 3)
    shapes(:,1,i) = estimatedPose(i,1:68);
    shapes(:,2,i) = estimatedPose(i,69:end);
end

[cfss_error,~,~,frontal_ids] = compute_error_small( experiments.labels, shapes-1.0);
cfss_error_frontal = cfss_error(frontal_ids);
cfss_error_profile = cfss_error(~frontal_ids);

load('results/tcdcn_JANUS.mat');
shapes_c = shapes;
shapes = zeros(68,2, numel(shapes_c));

for i = 1:size(shapes, 3)
    shapes(:,1,i) = shapes_c{i}(:,1);
    shapes(:,2,i) = shapes_c{i}(:,2);
end

[tcdcn_error,~,~,frontal_ids] = compute_error_small( experiments.labels, shapes-1.0);
tcdcn_error_frontal = tcdcn_error(frontal_ids);
tcdcn_error_profile = tcdcn_error(~frontal_ids);