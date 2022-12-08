function StartupCheck()

    try

        % Initialize to have all folders on path
        falcon.init(true);

        % print license agreement
        falcon.auxiliary.helpers.printLicenseAgreement();

        % Call the initialization checks
        falcon.console.CheckCommand().call();

        addpath(fileparts(mfilename('fullpath')));

        % Reinitialize if anything has changed
        falcon.init(true);

        fprintf('\nTry the FALCON.m examples in the <a href="matlab:cd %s">examples</a> folder.\n', ...
            fullfile(fileparts(mfilename('fullpath')), 'examples'));

    catch exception
        fprintf(2, '\nFailed to run StartupCheck: %s\n', exception.message);
        fprintf(2, 'Please ensure that the Matlab path is correct.\n');
    end

end