% Loop over
myCluster = parcluster('local');
myCluster.NumWorkers = 18;
parpool(18);

delete(gcp('nocreate'));
