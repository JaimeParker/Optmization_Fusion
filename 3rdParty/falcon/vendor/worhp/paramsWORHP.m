function [ p ] = paramsWORHP(  )

    %
    p.WorhpData.Attributes.revision = '1780';

    %% BOOLEAN
    % AlphaMinConst
    p.WorhpData.Params.BOOL{1}.Attributes.name = 'AlphaMinConst';
    p.WorhpData.Params.BOOL{1}.Text = 'False';
    
    % AutoQPRecovery
    p.WorhpData.Params.BOOL{2}.Attributes.name = 'AutoQPRecovery';
    p.WorhpData.Params.BOOL{2}.Text = 'True';
    
    % CheckStructureDF
    p.WorhpData.Params.BOOL{3}.Attributes.name = 'CheckStructureDF';
    p.WorhpData.Params.BOOL{3}.Text = 'False';

    % CheckStructureDG
    p.WorhpData.Params.BOOL{4}.Attributes.name = 'CheckStructureDG';
    p.WorhpData.Params.BOOL{4}.Text = 'False';
    
    % CheckStructureHM
    p.WorhpData.Params.BOOL{5}.Attributes.name = 'CheckStructureHM';
    p.WorhpData.Params.BOOL{5}.Text = 'False';
    
    % CorStepRecoveryDX
    p.WorhpData.Params.BOOL{6}.Attributes.name = 'CorStepRecoveryDX';
    p.WorhpData.Params.BOOL{6}.Text = 'False';
    
    % FeasibleDual
    p.WorhpData.Params.BOOL{7}.Attributes.name = 'FeasibleDual';
    p.WorhpData.Params.BOOL{7}.Text = 'False';
    
    % FeasibleInit
    p.WorhpData.Params.BOOL{8}.Attributes.name = 'FeasibleInit';
    p.WorhpData.Params.BOOL{8}.Text = 'False';
    
    % FeasibleOnly
    p.WorhpData.Params.BOOL{9}.Attributes.name = 'FeasibleOnly';
    p.WorhpData.Params.BOOL{9}.Text = 'False';
    
    % FGtogether
    p.WorhpData.Params.BOOL{10}.Attributes.name = 'FGtogether';
    p.WorhpData.Params.BOOL{10}.Text = 'False';
    
    % <BOOL name="WeakActiveSet"      >False</BOOL>
    p.WorhpData.Params.BOOL{11}.Attributes.name = 'WeakActiveSet';
    p.WorhpData.Params.BOOL{11}.Text = 'False';
    
    % FidifHM
    p.WorhpData.Params.BOOL{12}.Attributes.name = 'FidifHM';
    p.WorhpData.Params.BOOL{12}.Text = 'False';
    
    % FilterBisecAlpha
    p.WorhpData.Params.BOOL{13}.Attributes.name = 'FilterBisecAlpha';
    p.WorhpData.Params.BOOL{13}.Text = 'False';
    
    % FilterIntersecAlpha
    p.WorhpData.Params.BOOL{14}.Attributes.name = 'FilterIntersecAlpha';
    p.WorhpData.Params.BOOL{14}.Text = 'True';
       
    % <BOOL name="FirstDifCentral"    >True</BOOL>
    p.WorhpData.Params.BOOL{15}.Attributes.name = 'FirstDifCentral';
    p.WorhpData.Params.BOOL{15}.Text = 'True';
    
    % <BOOL name="FJandND"            >True</BOOL>
    p.WorhpData.Params.BOOL{16}.Attributes.name = 'FJandND';
    p.WorhpData.Params.BOOL{16}.Text = 'True';
    
    % <BOOL name="FocusOnFeas"        >True</BOOL>
    p.WorhpData.Params.BOOL{17}.Attributes.name = 'FocusOnFeas';
    p.WorhpData.Params.BOOL{17}.Text = 'True';
    
    % <BOOL name="IgnoreFilterCrit"   >True</BOOL>
    p.WorhpData.Params.BOOL{18}.Attributes.name = 'IgnoreFilterCrit';
    p.WorhpData.Params.BOOL{18}.Text = 'True';
    
    % <BOOL name="InitialLMest"       >True</BOOL>
    p.WorhpData.Params.BOOL{19}.Attributes.name = 'InitialLMest';
    p.WorhpData.Params.BOOL{19}.Text = 'True';
    
    % <BOOL name="KeepAcceptableSol"  >True</BOOL>
    p.WorhpData.Params.BOOL{20}.Attributes.name = 'KeepAcceptableSol';
    p.WorhpData.Params.BOOL{20}.Text = 'True';
    
    % <BOOL name="LinMult"            >False</BOOL>
    p.WorhpData.Params.BOOL{21}.Attributes.name = 'LinMult';
    p.WorhpData.Params.BOOL{21}.Text = 'False';
    
    % <BOOL name="LowPassFilter"      >True</BOOL>
    p.WorhpData.Params.BOOL{22}.Attributes.name = 'LowPassFilter';
    p.WorhpData.Params.BOOL{22}.Text = 'True';
    
    % <BOOL name="MaxNorm"            >True</BOOL>
    p.WorhpData.Params.BOOL{23}.Attributes.name = 'MaxNorm';
    p.WorhpData.Params.BOOL{23}.Text = 'True';
    
    % <BOOL name="MoreRelax"          >False</BOOL>
    p.WorhpData.Params.BOOL{24}.Attributes.name = 'MoreRelax';
    p.WorhpData.Params.BOOL{24}.Text = 'False';
    
    % <BOOL name="qp.ipTryRelax"      >True</BOOL>
    p.WorhpData.Params.BOOL{25}.Attributes.name = 'qp.ipTryRelax';
    p.WorhpData.Params.BOOL{25}.Text = 'True';
    
    % <BOOL name="qp.lsScale"         >True</BOOL>
    p.WorhpData.Params.BOOL{26}.Attributes.name = 'qp.lsScale';
    p.WorhpData.Params.BOOL{26}.Text = 'True';
    
    % <BOOL name="qp.lsTrySimple"     >False</BOOL>
    p.WorhpData.Params.BOOL{27}.Attributes.name = 'qp.lsTrySimple';
    p.WorhpData.Params.BOOL{27}.Text = 'False';
    
    % <BOOL name="qp.nsnGradStep"     >True</BOOL>
    p.WorhpData.Params.BOOL{28}.Attributes.name = 'qp.nsnGradStep';
    p.WorhpData.Params.BOOL{28}.Text = 'True';
    
    % <BOOL name="qp.scaleIntern"     >False</BOOL>
    p.WorhpData.Params.BOOL{29}.Attributes.name = 'qp.scaleIntern';
    p.WorhpData.Params.BOOL{29}.Text = 'False';
    
    % <BOOL name="qp.strict"          >True</BOOL>
    p.WorhpData.Params.BOOL{30}.Attributes.name = 'qp.strict';
    p.WorhpData.Params.BOOL{30}.Text = 'True';
    
    % <BOOL name="ReinitFilter"       >True</BOOL>
    p.WorhpData.Params.BOOL{31}.Attributes.name = 'ReinitFilter';
    p.WorhpData.Params.BOOL{31}.Text = 'True';
    
    % <BOOL name="RestUntilFeas"      >True</BOOL>
    p.WorhpData.Params.BOOL{32}.Attributes.name = 'RestUntilFeas';
    p.WorhpData.Params.BOOL{32}.Text = 'True';
    
    % <BOOL name="ScaleConIter"       >True</BOOL>
    p.WorhpData.Params.BOOL{33}.Attributes.name = 'ScaleConIter';
    p.WorhpData.Params.BOOL{33}.Text = 'True';
    
    % <BOOL name="ScaledFD"           >True</BOOL>
    p.WorhpData.Params.BOOL{34}.Attributes.name = 'ScaledFD';
    p.WorhpData.Params.BOOL{34}.Text = 'True';
    
    % <BOOL name="ScaledKKT"          >True</BOOL>
    p.WorhpData.Params.BOOL{35}.Attributes.name = 'ScaledKKT';
    p.WorhpData.Params.BOOL{35}.Text = 'True';
    
    % <BOOL name="ScaledObj"          >True</BOOL>
    p.WorhpData.Params.BOOL{36}.Attributes.name = 'ScaledObj';
    p.WorhpData.Params.BOOL{36}.Text = 'True';
    
    % <BOOL name="ScaledQP"           >True</BOOL>
    p.WorhpData.Params.BOOL{37}.Attributes.name = 'ScaledQP';
    p.WorhpData.Params.BOOL{37}.Text = 'True';
    
    % <BOOL name="TakeQPSol"          >False</BOOL>
    p.WorhpData.Params.BOOL{38}.Attributes.name = 'TakeQPSol';
    p.WorhpData.Params.BOOL{38}.Text = 'False';
    
    % <BOOL name="TooBig"             >True</BOOL>
    p.WorhpData.Params.BOOL{39}.Attributes.name = 'TooBig';
    p.WorhpData.Params.BOOL{39}.Text = 'True';
    
    % <BOOL name="UserDF"             >True</BOOL>
    p.WorhpData.Params.BOOL{40}.Attributes.name = 'UserDF';
    p.WorhpData.Params.BOOL{40}.Text = 'True';
    
    % <BOOL name="UserDG"             >True</BOOL>
    p.WorhpData.Params.BOOL{41}.Attributes.name = 'UserDG';
    p.WorhpData.Params.BOOL{41}.Text = 'True';
    
    % <BOOL name="UserHM"             >False</BOOL>
    p.WorhpData.Params.BOOL{42}.Attributes.name = 'UserHM';
    p.WorhpData.Params.BOOL{42}.Text = 'False';
    
    %    <BOOL   name="UseZen"           >False</BOOL>
    p.WorhpData.Params.BOOL{43}.Attributes.name = 'UseZen';
    p.WorhpData.Params.BOOL{43}.Text = 'False';
    
    %    <BOOL   name="UserZenDGp"       >False</BOOL>
    p.WorhpData.Params.BOOL{44}.Attributes.name = 'UserZenDGp';
    p.WorhpData.Params.BOOL{44}.Text = 'False';
    
    %    <BOOL   name="UserZenDLxp"      >False</BOOL>
    p.WorhpData.Params.BOOL{45}.Attributes.name = 'UserZenDLxp';
    p.WorhpData.Params.BOOL{45}.Text = 'False';
    
    %    <BOOL   name="UserZenDLp"       >False</BOOL>
    p.WorhpData.Params.BOOL{46}.Attributes.name = 'UserZenDLp';
    p.WorhpData.Params.BOOL{46}.Text = 'False';
    
    %    <BOOL   name="UserZenDLpp"      >False</BOOL>
    p.WorhpData.Params.BOOL{47}.Attributes.name = 'UserZenDLpp';
    p.WorhpData.Params.BOOL{47}.Text = 'False';
    
    %    <BOOL   name="ZenCheckMaxPert"  >False</BOOL>
    p.WorhpData.Params.BOOL{48}.Attributes.name = 'ZenCheckMaxPert';
    p.WorhpData.Params.BOOL{48}.Text = 'False';
    
    %    <BOOL   name="ZenRenewLU"       >False</BOOL>
    p.WorhpData.Params.BOOL{49}.Attributes.name = 'ZenRenewLU';
    p.WorhpData.Params.BOOL{49}.Text = 'False';
    
    %    <BOOL   name="ZenFDnewMethod"   >True</BOOL>
    p.WorhpData.Params.BOOL{50}.Attributes.name = 'ZenFDnewMethod';
    p.WorhpData.Params.BOOL{50}.Text = 'True';
    
    %    <BOOL   name="MA97blas3"        >False</BOOL>
    p.WorhpData.Params.BOOL{51}.Attributes.name = 'MA97blas3';
    p.WorhpData.Params.BOOL{51}.Text = 'False';
    
    %    <BOOL   name="MA97mf"           >False</BOOL>
    p.WorhpData.Params.BOOL{52}.Attributes.name = 'MA97mf';
    p.WorhpData.Params.BOOL{52}.Text = 'False';
    
    % <BOOL name="RefineOnlyOnAlpha"  >True</BOOL>
    p.WorhpData.Params.BOOL{53}.Attributes.name = 'RefineOnlyOnAlpha';
    p.WorhpData.Params.BOOL{53}.Text = 'True';
    
    %     <BOOL name="UpdateMu"           >False</BOOL>
    p.WorhpData.Params.BOOL{54}.Attributes.name = 'UpdateMu';
    p.WorhpData.Params.BOOL{54}.Text = 'False';
    
    %     <BOOL name="SteffensenOnRefine"           >True</BOOL>
    p.WorhpData.Params.BOOL{55}.Attributes.name = 'SteffensenOnRefine';
    p.WorhpData.Params.BOOL{55}.Text = 'True';
    
    %     <BOOL name="ShowMonitor"           >False</BOOL>
    p.WorhpData.Params.BOOL{56}.Attributes.name = 'ShowMonitor';
    p.WorhpData.Params.BOOL{56}.Text = 'False';
    
    %     <BOOL name="DetailedNewX"           >False</BOOL>
    p.WorhpData.Params.BOOL{57}.Attributes.name = 'DetailedNewX';
    p.WorhpData.Params.BOOL{57}.Text = 'False';
    
    %     <BOOL name="FidifGroups"           >True</BOOL>
    p.WorhpData.Params.BOOL{58}.Attributes.name = 'FidifGroups';
    p.WorhpData.Params.BOOL{58}.Text = 'True';
    
    %     <BOOL name="CheckGroups"           >False</BOOL>
    p.WorhpData.Params.BOOL{59}.Attributes.name = 'CheckGroups';
    p.WorhpData.Params.BOOL{59}.Text = 'False';
    
    %     <BOOL name="SecondDifCentral"           >True</BOOL>
    p.WorhpData.Params.BOOL{60}.Attributes.name = 'SecondDifCentral';
    p.WorhpData.Params.BOOL{60}.Text = 'True';
    
    %     <BOOL name="CheckValuesDF"           >False</BOOL>
    p.WorhpData.Params.BOOL{61}.Attributes.name = 'CheckValuesDF';
    p.WorhpData.Params.BOOL{61}.Text = 'False';
    
    %     <BOOL name="CheckValuesDG"           >False</BOOL>
    p.WorhpData.Params.BOOL{62}.Attributes.name = 'CheckValuesDG';
    p.WorhpData.Params.BOOL{62}.Text = 'False';
    
    %     <BOOL name="CheckValuesHM"           >False</BOOL>
    p.WorhpData.Params.BOOL{63}.Attributes.name = 'CheckValuesHM';
    p.WorhpData.Params.BOOL{63}.Text = 'False';
    
    %     <BOOL name="sKKTOnlyAcceptable"           >False</BOOL>
    p.WorhpData.Params.BOOL{64}.Attributes.name = 'sKKTOnlyAcceptable';
    p.WorhpData.Params.BOOL{64}.Text = 'False';
    
    %     <BOOL name="FilterRestFeas"           >True</BOOL>
    p.WorhpData.Params.BOOL{65}.Attributes.name = 'FilterRestFeas';
    p.WorhpData.Params.BOOL{65}.Text = 'True';
    
    %     <BOOL name="RefineFeasMerit"           >False</BOOL>
    p.WorhpData.Params.BOOL{66}.Attributes.name = 'RefineFeasMerit';
    p.WorhpData.Params.BOOL{66}.Text = 'False';
    
    %     <BOOL name="PostQPSensRelaxPen"           >False</BOOL>
    p.WorhpData.Params.BOOL{67}.Attributes.name = 'PostQPSensRelaxPen';
    p.WorhpData.Params.BOOL{67}.Text = 'False';
    
    %     <BOOL name="RelaxCon"           >True</BOOL>
    p.WorhpData.Params.BOOL{68}.Attributes.name = 'RelaxCon';
    p.WorhpData.Params.BOOL{68}.Text = 'True';
    
    %     <BOOL name="RelaxOnlyNonlinear"           >True</BOOL>
    p.WorhpData.Params.BOOL{69}.Attributes.name = 'RelaxOnlyNonlinear';
    p.WorhpData.Params.BOOL{69}.Text = 'True';
    
    %     <BOOL name="AdaptiveConstrRelax"           >False</BOOL>
    p.WorhpData.Params.BOOL{70}.Attributes.name = 'AdaptiveConstrRelax';
    p.WorhpData.Params.BOOL{70}.Text = 'False';
    
    %     <BOOL name="RelaxPenOnlyOne"           >True</BOOL>
    p.WorhpData.Params.BOOL{71}.Attributes.name = 'RelaxPenOnlyOne';
    p.WorhpData.Params.BOOL{71}.Text = 'True';
    
    %     <BOOL name="IP_NlpRelaxBoundsIter"           >True</BOOL>
    p.WorhpData.Params.BOOL{72}.Attributes.name = 'IP_NlpRelaxBoundsIter';
    p.WorhpData.Params.BOOL{72}.Text = 'True';
    
    %     <BOOL name="IP_InitDualAdjustment"           >True</BOOL>
    p.WorhpData.Params.BOOL{73}.Attributes.name = 'IP_InitDualAdjustment';
    p.WorhpData.Params.BOOL{73}.Text = 'True';
    
    %     <BOOL name="IP_WarmStore"           >True</BOOL>
    p.WorhpData.Params.BOOL{74}.Attributes.name = 'IP_WarmStore';
    p.WorhpData.Params.BOOL{74}.Text = 'True';
    
    %     <BOOL name="IP_WarmDualAdjustment"           >True</BOOL>
    p.WorhpData.Params.BOOL{75}.Attributes.name = 'IP_WarmDualAdjustment';
    p.WorhpData.Params.BOOL{75}.Text = 'True';
    
    %     <BOOL name="IP_LeqIncQuality"           >True</BOOL>
    p.WorhpData.Params.BOOL{76}.Attributes.name = 'IP_LeqIncQuality';
    p.WorhpData.Params.BOOL{76}.Text = 'True';
    
    %     <BOOL name="IP_LeqMa97Auto"           >True</BOOL>
    p.WorhpData.Params.BOOL{77}.Attributes.name = 'IP_LeqMa97Auto';
    p.WorhpData.Params.BOOL{77}.Text = 'True';
    
    %     <BOOL name="IP_LineSlackReset"           >True</BOOL>
    p.WorhpData.Params.BOOL{78}.Attributes.name = 'IP_LineSlackReset';
    p.WorhpData.Params.BOOL{78}.Text = 'True';
    
    %     <BOOL name="IP_CheckOrigCont"           >True</BOOL>
    p.WorhpData.Params.BOOL{79}.Attributes.name = 'IP_CheckOrigCont';
    p.WorhpData.Params.BOOL{79}.Text = 'True';
    
    %     <BOOL name="IP_CheckOrigContUnscale"           >True</BOOL>
    p.WorhpData.Params.BOOL{80}.Attributes.name = 'IP_CheckOrigContUnscale';
    p.WorhpData.Params.BOOL{80}.Text = 'True';
    
    %     <BOOL name="IP_ScaleF"           >True</BOOL>
    p.WorhpData.Params.BOOL{81}.Attributes.name = 'IP_ScaleF';
    p.WorhpData.Params.BOOL{81}.Text = 'True';
    
    %     <BOOL name="IP_ScaleG"           >True</BOOL>
    p.WorhpData.Params.BOOL{82}.Attributes.name = 'IP_ScaleG';
    p.WorhpData.Params.BOOL{82}.Text = 'True';
    
    %% INT
    
    % <INT name="BFGSmaxblockSize"    >3</INT>
    p.WorhpData.Params.INT{1}.Attributes.name = 'BFGSmaxblockSize';
    p.WorhpData.Params.INT{1}.Text = '3';
    
    % <INT name="BFGSmethod"          >2</INT>
    p.WorhpData.Params.INT{2}.Attributes.name = 'BFGSmethod';
    p.WorhpData.Params.INT{2}.Text = '2';
    
    % <INT name="BFGSminblockSize"    >1</INT>
    p.WorhpData.Params.INT{3}.Attributes.name = 'BFGSminblockSize';
    p.WorhpData.Params.INT{3}.Text = '1';
    
    % <INT name="BFGSrestart"         >44</INT>
    p.WorhpData.Params.INT{4}.Attributes.name = 'BFGSrestart';
    p.WorhpData.Params.INT{4}.Text = '44';
    
    % <INT name="CorStepMaxIter"      >1</INT>
    p.WorhpData.Params.INT{5}.Attributes.name = 'CorStepMaxIter';
    p.WorhpData.Params.INT{5}.Text = '1';
    
    % <INT name="CorStepMethod"       >0</INT>
    p.WorhpData.Params.INT{6}.Attributes.name = 'CorStepMethod';
    p.WorhpData.Params.INT{6}.Text = '0';
    
    % <INT name="CorStepMode"         >2</INT>
    p.WorhpData.Params.INT{7}.Attributes.name = 'CorStepMode';
    p.WorhpData.Params.INT{7}.Text = '2';
    
    % <INT name="GroupMethod"         >1</INT>
    p.WorhpData.Params.INT{8}.Attributes.name = 'GroupMethod';
    p.WorhpData.Params.INT{8}.Text = '1';
    
    % <INT name="LogLevel"            >0</INT>
    p.WorhpData.Params.INT{9}.Attributes.name = 'LogLevel';
    p.WorhpData.Params.INT{9}.Text = '0';
    
    % <INT name="LogResult"           >0</INT>
    p.WorhpData.Params.INT{10}.Attributes.name = 'LogResult';
    p.WorhpData.Params.INT{10}.Text = '0';
    
    % <INT name="MaxCalls"            >2147483647</INT>
    p.WorhpData.Params.INT{11}.Attributes.name = 'MaxCalls';
    p.WorhpData.Params.INT{11}.Text = '2147483647';
    
    % <INT name="MaxForce"            >4</INT>
    p.WorhpData.Params.INT{12}.Attributes.name = 'MaxForce';
    p.WorhpData.Params.INT{12}.Text = '4';
    
    % <INT name="MaxGPart"            >1</INT>
    p.WorhpData.Params.INT{13}.Attributes.name = 'MaxGPart';
    p.WorhpData.Params.INT{13}.Text = '1';
    
    % <INT name="MaxIter"             >10000</INT>
    p.WorhpData.Params.INT{14}.Attributes.name = 'MaxIter';
    p.WorhpData.Params.INT{14}.Text = '10000';
    
    % <INT name="MaxLScounter"        >13</INT>
    p.WorhpData.Params.INT{15}.Attributes.name = 'MaxLScounter';
    p.WorhpData.Params.INT{15}.Text = '13';
    
    % <INT name="MeritFunction"       >4</INT>
    p.WorhpData.Params.INT{16}.Attributes.name = 'MeritFunction';
    p.WorhpData.Params.INT{16}.Text = '4';
    
    % <INT name="NLPmethod"           >3</INT>
    p.WorhpData.Params.INT{17}.Attributes.name = 'NLPmethod';
    p.WorhpData.Params.INT{17}.Text = '3';
    
    % <INT name="NLPprint"            >2</INT>
    p.WorhpData.Params.INT{18}.Attributes.name = 'NLPprint';
    p.WorhpData.Params.INT{18}.Text = '2';
    
    % <INT name="PairMethod"          >11</INT>
    p.WorhpData.Params.INT{19}.Attributes.name = 'PairMethod';
    p.WorhpData.Params.INT{19}.Text = '11';
    
    % <INT name="PenUpdEpsKSequence"  >2</INT>
    p.WorhpData.Params.INT{20}.Attributes.name = 'PenUpdEpsKSequence';
    p.WorhpData.Params.INT{20}.Text = '2';
    
    % <INT name="qp.ipLsMethod"       >1</INT>
    p.WorhpData.Params.INT{21}.Attributes.name = 'qp.ipLsMethod';
    p.WorhpData.Params.INT{21}.Text = '1';
    
    % <INT name="qp.lsItMaxIter"      >1000</INT>
    p.WorhpData.Params.INT{22}.Attributes.name = 'qp.lsItMaxIter';
    p.WorhpData.Params.INT{22}.Text = '1000';
    
    % <INT name="qp.lsItMethod"       >0</INT>
    p.WorhpData.Params.INT{23}.Attributes.name = 'qp.lsItMethod';
    p.WorhpData.Params.INT{23}.Text = '0';
    
    % <INT name="qp.lsItPrecondMethod">0</INT>
    p.WorhpData.Params.INT{24}.Attributes.name = 'qp.lsItPrecondMethod';
    p.WorhpData.Params.INT{24}.Text = '0';
    
    % <INT name="qp.lsRefineMaxIter"  >10</INT>
    p.WorhpData.Params.INT{25}.Attributes.name = 'qp.lsRefineMaxIter';
    p.WorhpData.Params.INT{25}.Text = '10';
    
    % <INT name="qp.maxIter"          >500</INT>
    p.WorhpData.Params.INT{26}.Attributes.name = 'qp.maxIter';
    p.WorhpData.Params.INT{26}.Text = '500';
    
    % <INT name="qp.method"           >1</INT>
    p.WorhpData.Params.INT{27}.Attributes.name = 'qp.method';
    p.WorhpData.Params.INT{27}.Text = '1';
    
    % <INT name="qp.nsnLsMethod"      >4</INT>
    p.WorhpData.Params.INT{28}.Attributes.name = 'qp.nsnLsMethod';
    p.WorhpData.Params.INT{28}.Text = '4';
    
    % <INT name="qp.printLevel"       >0</INT>
    p.WorhpData.Params.INT{29}.Attributes.name = 'qp.printLevel';
    p.WorhpData.Params.INT{29}.Text = '0';
    
    % <INT name="RegStrategy"         >3</INT>
    p.WorhpData.Params.INT{30}.Attributes.name = 'RegStrategy';
    p.WorhpData.Params.INT{30}.Text = '3';
    
    % <INT name="UserHMstructure"     >2</INT>
    p.WorhpData.Params.INT{31}.Attributes.name = 'UserHMstructure';
    p.WorhpData.Params.INT{31}.Text = '2';
    
    % <INT    name="MA97ordering"     >5</INT>
    p.WorhpData.Params.INT{32}.Attributes.name = 'MA97ordering';
    p.WorhpData.Params.INT{32}.Text = '5';
    
    % <INT    name="MA97scaling"      >0</INT>
    p.WorhpData.Params.INT{33}.Attributes.name = 'MA97scaling';
    p.WorhpData.Params.INT{33}.Text = '0';
    
    %    <INT    name="MA97print"        >-1</INT>
    p.WorhpData.Params.INT{34}.Attributes.name = 'MA97print';
    p.WorhpData.Params.INT{34}.Text = '-1';
    
    %    <INT    name="MA97nemin"        >8</INT>
    p.WorhpData.Params.INT{35}.Attributes.name = 'MA97nemin';
    p.WorhpData.Params.INT{35}.Text = '8';
    
    % <INT name="RefineFeasibility"  >0</INT>
    p.WorhpData.Params.INT{36}.Attributes.name = 'RefineFeasibility';
    p.WorhpData.Params.INT{36}.Text = '0';
    
    % <INT name="Algorithm"  >1</INT>
    p.WorhpData.Params.INT{37}.Attributes.name = 'Algorithm';
    p.WorhpData.Params.INT{37}.Text = '1';
    
    % <INT name="Crossover"  >0</INT>
    p.WorhpData.Params.INT{38}.Attributes.name = 'Crossover';
    p.WorhpData.Params.INT{38}.Text = '0';
    
    % <INT name="CrossoverIter"  >-1</INT>
    p.WorhpData.Params.INT{39}.Attributes.name = 'CrossoverIter';
    p.WorhpData.Params.INT{39}.Text = '-1';
    
    % <INT name="CheckDerivIter"  >0</INT>
    p.WorhpData.Params.INT{40}.Attributes.name = 'CheckDerivIter';
    p.WorhpData.Params.INT{40}.Text = '0';
    
    % <INT name="CheckDerivIter"  >0</INT>
    p.WorhpData.Params.INT{41}.Attributes.name = 'CheckDerivIter';
    p.WorhpData.Params.INT{41}.Text = '0';
    
    % <INT name="SwitchMode"  >0</INT>
    p.WorhpData.Params.INT{42}.Attributes.name = 'SwitchMode';
    p.WorhpData.Params.INT{42}.Text = '0';
    
    % <INT name="SwitchModeMaxMinor"  >4</INT>
    p.WorhpData.Params.INT{43}.Attributes.name = 'SwitchModeMaxMinor';
    p.WorhpData.Params.INT{43}.Text = '4';
    
    % <INT name="SwitchModeMaxIter"  >7</INT>
    p.WorhpData.Params.INT{44}.Attributes.name = 'SwitchModeMaxIter';
    p.WorhpData.Params.INT{44}.Text = '7';
    
    % <INT name="SwitchModeTermination"  >0</INT>
    p.WorhpData.Params.INT{45}.Attributes.name = 'SwitchModeTermination';
    p.WorhpData.Params.INT{45}.Text = '0';
    
    % <INT name="SwitchModeTolerances"  >0</INT>
    p.WorhpData.Params.INT{46}.Attributes.name = 'SwitchModeTolerances';
    p.WorhpData.Params.INT{46}.Text = '0';
    % <INT name="LineSearchMethod"  >3</INT>
    p.WorhpData.Params.INT{47}.Attributes.name = 'LineSearchMethod';
    p.WorhpData.Params.INT{47}.Text = '3';
    
    % <INT name="RefineFeasMaxIter"  >500</INT>
    p.WorhpData.Params.INT{48}.Attributes.name = 'RefineFeasMaxIter';
    p.WorhpData.Params.INT{48}.Text = '500';
    
    % <INT name="RefineFeasTermination"  >1</INT>
    p.WorhpData.Params.INT{49}.Attributes.name = 'RefineFeasTermination';
    p.WorhpData.Params.INT{49}.Text = '1';
    
    % <INT name="PostQPSensRegVal"  >0</INT>
    p.WorhpData.Params.INT{50}.Attributes.name = 'PostQPSensRegVal';
    p.WorhpData.Params.INT{50}.Text = '0';
    
    % <INT name="PostQPSensitivity"  >0</INT>
    p.WorhpData.Params.INT{51}.Attributes.name = 'PostQPSensitivity';
    p.WorhpData.Params.INT{51}.Text = '0';
    
    % <INT name="IP_BarrierType"  >1</INT>
    p.WorhpData.Params.INT{52}.Attributes.name = 'IP_BarrierType';
    p.WorhpData.Params.INT{52}.Text = '1';
    
    % <INT name="IP_BarrierUpdate"  >1</INT>
    p.WorhpData.Params.INT{53}.Attributes.name = 'IP_BarrierUpdate';
    p.WorhpData.Params.INT{53}.Text = '1';
    
    % <INT name="IP_BarrierUpdateAug"  >2</INT>
    p.WorhpData.Params.INT{54}.Attributes.name = 'IP_BarrierUpdateAug';
    p.WorhpData.Params.INT{54}.Text = '2';
    
    % <INT name="IP_BarrierIterFast"  >3</INT>
    p.WorhpData.Params.INT{55}.Attributes.name = 'IP_BarrierIterFast';
    p.WorhpData.Params.INT{55}.Text = '3';
    
    % <INT name="IP_BarrierInitAug"  >1</INT>
    p.WorhpData.Params.INT{56}.Attributes.name = 'IP_BarrierInitAug';
    p.WorhpData.Params.INT{56}.Text = '1';
    
    % <INT name="IP_PenaltyType"  >3</INT>
    p.WorhpData.Params.INT{57}.Attributes.name = 'IP_PenaltyType';
    p.WorhpData.Params.INT{57}.Text = '3';
    
    % <INT name="IP_PenaltyUpdate"  >3</INT>
    p.WorhpData.Params.INT{58}.Attributes.name = 'IP_PenaltyUpdate';
    p.WorhpData.Params.INT{58}.Text = '3';
    
    % <INT name="IP_PenaltyPosition"  >3</INT>
    p.WorhpData.Params.INT{59}.Attributes.name = 'IP_PenaltyPosition';
    p.WorhpData.Params.INT{59}.Text = '3';
    
    % <INT name="IP_PenaltyInitAug"  >1</INT>
    p.WorhpData.Params.INT{60}.Attributes.name = 'IP_PenaltyInitAug';
    p.WorhpData.Params.INT{60}.Text = '1';
    
    % <INT name="IP_InitMethodDual"  >3</INT>
    p.WorhpData.Params.INT{61}.Attributes.name = 'IP_InitMethodDual';
    p.WorhpData.Params.INT{61}.Text = '3';
    
    % <INT name="IP_InitMethodDualBox"  >2</INT>
    p.WorhpData.Params.INT{62}.Attributes.name = 'IP_InitMethodDualBox';
    p.WorhpData.Params.INT{62}.Text = '2';
    
    % <INT name="IP_WarmMethodDual"  >3</INT>
    p.WorhpData.Params.INT{63}.Attributes.name = 'IP_WarmMethodDual';
    p.WorhpData.Params.INT{63}.Text = '3';
    
    % <INT name="IP_WarmMethodDualBox"  >3</INT>
    p.WorhpData.Params.INT{64}.Attributes.name = 'IP_WarmMethodDualBox';
    p.WorhpData.Params.INT{64}.Text = '3';
    
    % <INT name="IP_LeqItRefRedMaxIter"  >0</INT>
    p.WorhpData.Params.INT{65}.Attributes.name = 'IP_LeqItRefRedMaxIter';
    p.WorhpData.Params.INT{65}.Text = '0';
    
    % <INT name="IP_LeqItRefMinIter"  >0</INT>
    p.WorhpData.Params.INT{66}.Attributes.name = 'IP_LeqItRefMinIter';
    p.WorhpData.Params.INT{66}.Text = '0';
    
    % <INT name="IP_LeqItRefMaxIter"  >10</INT>
    p.WorhpData.Params.INT{67}.Attributes.name = 'IP_LeqItRefMaxIter';
    p.WorhpData.Params.INT{67}.Text = '10';
    
    % <INT name="IP_RefineStep"  >2</INT>
    p.WorhpData.Params.INT{68}.Attributes.name = 'IP_RefineStep';
    p.WorhpData.Params.INT{68}.Text = '2';
    
    % <INT name="IP_RefineStepMaxIter"  >1</INT>
    p.WorhpData.Params.INT{69}.Attributes.name = 'IP_RefineStepMaxIter';
    p.WorhpData.Params.INT{69}.Text = '1';
    
    % <INT name="IP_LineMethod"  >4</INT>
    p.WorhpData.Params.INT{70}.Attributes.name = 'IP_LineMethod';
    p.WorhpData.Params.INT{70}.Text = '4';
    
    % <INT name="IP_LineMethodBackup"  >5</INT>
    p.WorhpData.Params.INT{71}.Attributes.name = 'IP_LineIP_LineMethodBackupMethod';
    p.WorhpData.Params.INT{71}.Text = '5';
    
    % <INT name="IP_LineMeritNonmon"  >3</INT>
    p.WorhpData.Params.INT{72}.Attributes.name = 'IP_LineMeritNonmon';
    p.WorhpData.Params.INT{72}.Text = '3';
    
    % <INT name="IP_LineFilterNonmon"  >1</INT>
    p.WorhpData.Params.INT{73}.Attributes.name = 'IP_LineFilterNonmon';
    p.WorhpData.Params.INT{73}.Text = '1';
    
    % <INT name="IP_LineCorMaxIter"  >0</INT>
    p.WorhpData.Params.INT{74}.Attributes.name = 'IP_LineCorMaxIter';
    p.WorhpData.Params.INT{74}.Text = '0';
    
    % <INT name="IP_CheckInfeas"  >2</INT>
    p.WorhpData.Params.INT{75}.Attributes.name = 'IP_CheckInfeas';
    p.WorhpData.Params.INT{75}.Text = '2';
    
    % <INT name="IP_CheckFritzJohn"  >2</INT>
    p.WorhpData.Params.INT{76}.Attributes.name = 'IP_CheckFritzJohn';
    p.WorhpData.Params.INT{76}.Text = '2';
    
    % <INT name="IP_CheckNanInf"  >2</INT>
    p.WorhpData.Params.INT{77}.Attributes.name = 'IP_CheckNanInf';
    p.WorhpData.Params.INT{77}.Text = '2';
    
    % <INT name="IP_CheckOrigContMaxIter"  >10000</INT>
    p.WorhpData.Params.INT{78}.Attributes.name = 'IP_CheckOrigContMaxIter';
    p.WorhpData.Params.INT{78}.Text = '10000';
    
    % <INT name="ZenStore"  >3</INT>
    p.WorhpData.Params.INT{79}.Attributes.name = 'ZenStore';
    p.WorhpData.Params.INT{79}.Text = '3';
    
    % <INT name="MA97factorMin"  >1</INT>
    p.WorhpData.Params.INT{80}.Attributes.name = 'MA97factorMin';
    p.WorhpData.Params.INT{80}.Text = '1';
    
    %% DOUBLE
    %  <DOUBLE name="AcceptTolFeas"    >1.0000000000000000e-03</DOUBLE>
    p.WorhpData.Params.DOUBLE{1}.Attributes.name = 'AcceptTolFeas';
    p.WorhpData.Params.DOUBLE{1}.Text = '1.0000000000000000e-03';
    
    %    <DOUBLE name="AcceptTolOpti"    >1.0000000000000000e-03</DOUBLE>
    p.WorhpData.Params.DOUBLE{2}.Attributes.name = 'AcceptTolOpti';
    p.WorhpData.Params.DOUBLE{2}.Text = '1.0000000000000000e-03';
    
    %    <DOUBLE name="ArmijoBeta"       >8.9500000000000000e-01</DOUBLE>
    p.WorhpData.Params.DOUBLE{3}.Attributes.name = 'ArmijoBeta';
    p.WorhpData.Params.DOUBLE{3}.Text = '8.9500000000000000e-01';
    
    %    <DOUBLE name="ArmijoMaxAlpha"   >9.9999999999990000e-01</DOUBLE>
    p.WorhpData.Params.DOUBLE{4}.Attributes.name = 'ArmijoMaxAlpha';
    p.WorhpData.Params.DOUBLE{4}.Text = '9.9999999999990000e-01';
    
    %    <DOUBLE name="ArmijoMinAlpha"   >5.0000000000000000e-07</DOUBLE>
    p.WorhpData.Params.DOUBLE{5}.Attributes.name = 'ArmijoMinAlpha';
    p.WorhpData.Params.DOUBLE{5}.Text = '5.0000000000000000e-07';
    
    %    <DOUBLE name="ArmijoMinAlphaRec">1.0000000000000000e-06</DOUBLE>
    p.WorhpData.Params.DOUBLE{6}.Attributes.name = 'ArmijoMinAlphaRec';
    p.WorhpData.Params.DOUBLE{6}.Text = '1.0000000000000000e-06';
    
    %    <DOUBLE name="ArmijoSigma"      >5.0000000000000000e-03</DOUBLE>
    p.WorhpData.Params.DOUBLE{7}.Attributes.name = 'ArmijoSigma';
    p.WorhpData.Params.DOUBLE{7}.Text = '5.0000000000000000e-03';
    
    %    <DOUBLE name="BettsFactor"      >2.1000000000000000e+00</DOUBLE>
    p.WorhpData.Params.DOUBLE{8}.Attributes.name = 'BettsFactor';
    p.WorhpData.Params.DOUBLE{8}.Text = '2.1000000000000000e+00';
    
    %    <DOUBLE name="BettsPoint"       >1.0000000000000000e+00</DOUBLE>
    p.WorhpData.Params.DOUBLE{9}.Attributes.name = 'BettsPoint';
    p.WorhpData.Params.DOUBLE{9}.Text = '1.0000000000000000e+00';
    
    %    <DOUBLE name="BoundTolFac"      >1.0000000000000000e+03</DOUBLE>
    p.WorhpData.Params.DOUBLE{10}.Attributes.name = 'BoundTolFac';
    p.WorhpData.Params.DOUBLE{10}.Text = '1.0000000000000000e+03';
    
    %    <DOUBLE name="CheckFJ"          >1.0000000000000000e+12</DOUBLE>
    p.WorhpData.Params.DOUBLE{11}.Attributes.name = 'CheckFJ';
    p.WorhpData.Params.DOUBLE{11}.Text = '1.0000000000000000e+12';
    
    %    <DOUBLE name="CorStepBettsSum"  >1.0000000000000000e+00</DOUBLE>
    p.WorhpData.Params.DOUBLE{12}.Attributes.name = 'CorStepBettsSum';
    p.WorhpData.Params.DOUBLE{12}.Text = '1.0000000000000000e+00';
    
    %    <DOUBLE name="CorStepConStop"   >1.0000000000000000e-06</DOUBLE>
    p.WorhpData.Params.DOUBLE{13}.Attributes.name = 'CorStepConStop';
    p.WorhpData.Params.DOUBLE{13}.Text = '1.0000000000000000e-06';
    
    %    <DOUBLE name="CorStepConvio"    >5.0000000000000000e+01</DOUBLE>
    p.WorhpData.Params.DOUBLE{14}.Attributes.name = 'CorStepConvio';
    p.WorhpData.Params.DOUBLE{14}.Text = '5.0000000000000000e+01';
    
    %    <DOUBLE name="CorStepPFactor"   >1.0000000000000000e-00</DOUBLE>
    p.WorhpData.Params.DOUBLE{15}.Attributes.name = 'CorStepPFactor';
    p.WorhpData.Params.DOUBLE{15}.Text = '1.0000000000000000e-00';
    
    %    <DOUBLE name="CorStepPMax"      >1.0000000000000000e+06</DOUBLE>
    p.WorhpData.Params.DOUBLE{16}.Attributes.name = 'CorStepPMax';
    p.WorhpData.Params.DOUBLE{16}.Text = '1.0000000000000000e+06';
    
    %    <DOUBLE name="CurvBCond"        >2.0000000000000000e-02</DOUBLE>
    p.WorhpData.Params.DOUBLE{17}.Attributes.name = 'CurvBCond';
    p.WorhpData.Params.DOUBLE{17}.Text = '2.0000000000000000e-02';
    
    %    <DOUBLE name="CurvBFac"         >3.0000000000000000e-01</DOUBLE>
    p.WorhpData.Params.DOUBLE{18}.Attributes.name = 'CurvBFac';
    p.WorhpData.Params.DOUBLE{18}.Text = '3.0000000000000000e-01';
    
    %    <DOUBLE name="CurvCond"         >2.0000000000000000e-02</DOUBLE>
    p.WorhpData.Params.DOUBLE{19}.Attributes.name = 'CurvCond';
    p.WorhpData.Params.DOUBLE{19}.Text = '2.0000000000000000e-02';
    
    %    <DOUBLE name="CurvFac"          >3.0000000000000000e-01</DOUBLE>
    p.WorhpData.Params.DOUBLE{20}.Attributes.name = 'CurvFac';
    p.WorhpData.Params.DOUBLE{20}.Text = '3.0000000000000000e-01';
    
    %    <DOUBLE name="CutLength"        >1.0000000000000000e-03</DOUBLE>
    p.WorhpData.Params.DOUBLE{21}.Attributes.name = 'CutLength';
    p.WorhpData.Params.DOUBLE{21}.Text = '1.0000000000000000e-03';
    
    %    <DOUBLE name="eps"              >2.2204460492503131e-16</DOUBLE>
    p.WorhpData.Params.DOUBLE{22}.Attributes.name = 'eps';
    p.WorhpData.Params.DOUBLE{22}.Text = '2.2204460492503131e-16';
    
    %    <DOUBLE name="FeasibleInitTol"  >1.0000000000000000e-03</DOUBLE>
    p.WorhpData.Params.DOUBLE{23}.Attributes.name = 'FeasibleInitTol';
    p.WorhpData.Params.DOUBLE{23}.Text = '1.0000000000000000e-03';
    
    %    <DOUBLE name="FidifEps"         >1.0000000000000000e-05</DOUBLE>
    p.WorhpData.Params.DOUBLE{24}.Attributes.name = 'FidifEps';
    p.WorhpData.Params.DOUBLE{24}.Text = '1.0000000000000000e-05';
    
    %    <DOUBLE name="FilterGammaCV"    >5.0000000000000000e-04</DOUBLE>
    p.WorhpData.Params.DOUBLE{25}.Attributes.name = 'FilterGammaCV';
    p.WorhpData.Params.DOUBLE{25}.Text = '5.0000000000000000e-04';
    
    %    <DOUBLE name="FilterGammaF"     >5.0000000000000000e-03</DOUBLE>
    p.WorhpData.Params.DOUBLE{26}.Attributes.name = 'FilterGammaF';
    p.WorhpData.Params.DOUBLE{26}.Text = '5.0000000000000000e-03';
    
    %    <DOUBLE name="FocusOnFeasFactor">1.0100000000000000e+00</DOUBLE>
    p.WorhpData.Params.DOUBLE{27}.Attributes.name = 'FocusOnFeasFactor';
    p.WorhpData.Params.DOUBLE{27}.Text = '1.0100000000000000e+00';
    
    %    <DOUBLE name="GammaAlpha"       >1.0000000000000000e-02</DOUBLE>
    p.WorhpData.Params.DOUBLE{28}.Attributes.name = 'GammaAlpha';
    p.WorhpData.Params.DOUBLE{28}.Text = '1.0000000000000000e-02';
    
    %    <DOUBLE name="IncBettsTau"      >2.0000000000000000e-00</DOUBLE>
    p.WorhpData.Params.DOUBLE{29}.Attributes.name = 'IncBettsTau';
    p.WorhpData.Params.DOUBLE{29}.Text = '2.0000000000000000e-00';
    
    %    <DOUBLE name="IncBettsTauMore"  >3.0000000000000000e-00</DOUBLE>
    p.WorhpData.Params.DOUBLE{30}.Attributes.name = 'IncBettsTauMore';
    p.WorhpData.Params.DOUBLE{30}.Text = '3.0000000000000000e-00';
    
    %    <DOUBLE name="IncreaseIWS"      >1.0000000000000000e+00</DOUBLE>
    p.WorhpData.Params.DOUBLE{31}.Attributes.name = 'IncreaseIWS';
    p.WorhpData.Params.DOUBLE{31}.Text = '1.0000000000000000e+00';
    
    %    <DOUBLE name="IncreaseRWS"      >1.0000000000000000e+00</DOUBLE>
    p.WorhpData.Params.DOUBLE{32}.Attributes.name = 'IncreaseRWS';
    p.WorhpData.Params.DOUBLE{32}.Text = '1.0000000000000000e+00';
    
    %    <DOUBLE name="Infty"            >1.0000000000000000e+20</DOUBLE>
    p.WorhpData.Params.DOUBLE{33}.Attributes.name = 'Infty';
    p.WorhpData.Params.DOUBLE{33}.Text = '1.0000000000000000e+20';
    
    %    <DOUBLE name="InftyUnbounded"   >1.0000000000000000e+20</DOUBLE>
    p.WorhpData.Params.DOUBLE{34}.Attributes.name = 'InftyUnbounded';
    p.WorhpData.Params.DOUBLE{34}.Text = '1.0000000000000000e+20';
    
    %    <DOUBLE name="LMestQPipComTol"  >1.0000000000000000e-03</DOUBLE>
    p.WorhpData.Params.DOUBLE{35}.Attributes.name = 'LMestQPipComTol';
    p.WorhpData.Params.DOUBLE{35}.Text = '1.0000000000000000e-03';
    
    %    <DOUBLE name="LMestQPipResTol"  >1.0000000000000000e-03</DOUBLE>
    p.WorhpData.Params.DOUBLE{36}.Attributes.name = 'LMestQPipResTol';
    p.WorhpData.Params.DOUBLE{36}.Text = '1.0000000000000000e-03';
    
    %    <DOUBLE name="LowPassAlphaF"    >9.5000000000000000e-01</DOUBLE>
    p.WorhpData.Params.DOUBLE{37}.Attributes.name = 'LowPassAlphaF';
    p.WorhpData.Params.DOUBLE{37}.Text = '9.5000000000000000e-01';
    
    %    <DOUBLE name="LowPassAlphaG"    >9.5000000000000000e-01</DOUBLE>
    p.WorhpData.Params.DOUBLE{38}.Attributes.name = 'LowPassAlphaG';
    p.WorhpData.Params.DOUBLE{38}.Text = '9.5000000000000000e-01';
    
    %    <DOUBLE name="LowPassAlphaMerit">1.0000000000000000e-01</DOUBLE>
    p.WorhpData.Params.DOUBLE{39}.Attributes.name = 'LowPassAlphaMerit';
    p.WorhpData.Params.DOUBLE{39}.Text = '1.0000000000000000e-01';
    
    %    <DOUBLE name="MeritGradTol"     >2.2204460492503131e-16</DOUBLE>
    p.WorhpData.Params.DOUBLE{40}.Attributes.name = 'MeritGradTol';
    p.WorhpData.Params.DOUBLE{40}.Text = '2.2204460492503131e-16';
    
    %    <DOUBLE name="MinBettsTau"      >6.0000000000000000e-16</DOUBLE>
    p.WorhpData.Params.DOUBLE{41}.Attributes.name = 'MinBettsTau';
    p.WorhpData.Params.DOUBLE{41}.Text = '6.0000000000000000e-16';
    
    %    <DOUBLE name="PenUpdEpsBar"     >9.0000000000000000e-01</DOUBLE>
    p.WorhpData.Params.DOUBLE{42}.Attributes.name = 'PenUpdEpsBar';
    p.WorhpData.Params.DOUBLE{42}.Text = '9.0000000000000000e-01';
    
    %    <DOUBLE name="PenUpdEpsKFac"    >2.0000000000000000e+00</DOUBLE>
    p.WorhpData.Params.DOUBLE{43}.Attributes.name = 'PenUpdEpsKFac';
    p.WorhpData.Params.DOUBLE{43}.Text = '2.0000000000000000e+00';
    
    %    <DOUBLE name="PenUpdMaxDeltaK"  >1.1000000000000000e+01</DOUBLE>
    p.WorhpData.Params.DOUBLE{44}.Attributes.name = 'PenUpdMaxDeltaK';
    p.WorhpData.Params.DOUBLE{44}.Text = '1.1000000000000000e+01';
    
    %    <DOUBLE name="PenUpdMaxFac"     >1.0000000000000000e+08</DOUBLE>
    p.WorhpData.Params.DOUBLE{45}.Attributes.name = 'PenUpdMaxFac';
    p.WorhpData.Params.DOUBLE{45}.Text = '1.0000000000000000e+08';
    
    %    <DOUBLE name="PenUpdRBar"       >2.0000000000000000e+00</DOUBLE>
    p.WorhpData.Params.DOUBLE{46}.Attributes.name = 'PenUpdRBar';
    p.WorhpData.Params.DOUBLE{46}.Text = '2.0000000000000000e+00';
    
    %    <DOUBLE name="PrecisionF"       >2.2204460492503131e-16</DOUBLE>
    p.WorhpData.Params.DOUBLE{47}.Attributes.name = 'PrecisionF';
    p.WorhpData.Params.DOUBLE{47}.Text = '2.2204460492503131e-16';
    
    %    <DOUBLE name="PrecisionG"       >2.2204460492503131e-16</DOUBLE>
    p.WorhpData.Params.DOUBLE{48}.Attributes.name = 'PrecisionG';
    p.WorhpData.Params.DOUBLE{48}.Text = '2.2204460492503131e-16';
    
    %    <DOUBLE name="qp.ipBarrier"     >8.9000000000000000e+00</DOUBLE>
    p.WorhpData.Params.DOUBLE{49}.Attributes.name = 'qp.ipBarrier';
    p.WorhpData.Params.DOUBLE{49}.Text = '8.9000000000000000e+00';
    
    %    <DOUBLE name="qp.ipComTol"      >2.0000000000000000e-08</DOUBLE>
    p.WorhpData.Params.DOUBLE{50}.Attributes.name = 'qp.ipComTol';
    p.WorhpData.Params.DOUBLE{50}.Text = '2.0000000000000000e-08';
    
    %    <DOUBLE name="qp.ipFracBound"   >8.8000000000000000e-01</DOUBLE>
    p.WorhpData.Params.DOUBLE{51}.Attributes.name = 'qp.ipFracBound';
    p.WorhpData.Params.DOUBLE{51}.Text = '8.8000000000000000e-01';
    
    %    <DOUBLE name="qp.ipMinAlpha"    >1.0000000000000000e-11</DOUBLE>
    p.WorhpData.Params.DOUBLE{52}.Attributes.name = 'qp.ipMinAlpha';
    p.WorhpData.Params.DOUBLE{52}.Text = '1.0000000000000000e-11';
    
    %    <DOUBLE name="qp.ipRelaxDiv"    >2.0000000000000000e+00</DOUBLE>
    p.WorhpData.Params.DOUBLE{53}.Attributes.name = 'qp.ipRelaxDiv';
    p.WorhpData.Params.DOUBLE{53}.Text = '2.0000000000000000e+00';
    
    %    <DOUBLE name="qp.ipRelaxMax"    >1.0000000000000000e-12</DOUBLE>
    p.WorhpData.Params.DOUBLE{54}.Attributes.name = 'qp.ipRelaxMax';
    p.WorhpData.Params.DOUBLE{54}.Text = '1.0000000000000000e-12';
    
    %    <DOUBLE name="qp.ipRelaxMin"    >9.1000000000000000e-10</DOUBLE>
    p.WorhpData.Params.DOUBLE{55}.Attributes.name = 'qp.ipRelaxMin';
    p.WorhpData.Params.DOUBLE{55}.Text = '9.1000000000000000e-10';
    
    %    <DOUBLE name="qp.ipRelaxMult"   >1.0000000000000000e+01</DOUBLE>
    p.WorhpData.Params.DOUBLE{56}.Attributes.name = 'qp.ipRelaxMult';
    p.WorhpData.Params.DOUBLE{56}.Text = '1.0000000000000000e+01';
    
    %    <DOUBLE name="qp.ipResTol"      >4.0000000000000000e-09</DOUBLE>
    p.WorhpData.Params.DOUBLE{57}.Attributes.name = 'qp.ipResTol';
    p.WorhpData.Params.DOUBLE{57}.Text = '4.0000000000000000e-09';
    
    %    <DOUBLE name="qp.lsTol"         >1.0000000000000000e-10</DOUBLE>
    p.WorhpData.Params.DOUBLE{58}.Attributes.name = 'qp.lsTol';
    p.WorhpData.Params.DOUBLE{58}.Text = '1.0000000000000000e-10';
    
    %    <DOUBLE name="qp.nsnBeta"       >9.0000000000000000e-01</DOUBLE>
    p.WorhpData.Params.DOUBLE{59}.Attributes.name = 'qp.nsnBeta';
    p.WorhpData.Params.DOUBLE{59}.Text = '9.0000000000000000e-01';
    
    %    <DOUBLE name="qp.nsnKKT"        >1.0000000000000000e-06</DOUBLE>
    p.WorhpData.Params.DOUBLE{60}.Attributes.name = 'qp.nsnKKT';
    p.WorhpData.Params.DOUBLE{60}.Text = '1.0000000000000000e-06';
    
    %    <DOUBLE name="qp.nsnMinAlpha"   >1.0000000000000000e-11</DOUBLE>
    p.WorhpData.Params.DOUBLE{61}.Attributes.name = 'qp.nsnMinAlpha';
    p.WorhpData.Params.DOUBLE{61}.Text = '1.0000000000000000e-11';
    
    %    <DOUBLE name="qp.nsnSigma"      >1.0000000000000000e-02</DOUBLE>
    p.WorhpData.Params.DOUBLE{62}.Attributes.name = 'qp.nsnSigma';
    p.WorhpData.Params.DOUBLE{62}.Text = '1.0000000000000000e-02';
    
    %    <DOUBLE name="QPscaleParam"     >2.0000000000000000e-02</DOUBLE>
    p.WorhpData.Params.DOUBLE{63}.Attributes.name = 'QPscaleParam';
    p.WorhpData.Params.DOUBLE{63}.Text = '2.0000000000000000e-02';
    
    %    <DOUBLE name="ReduceBettsTau"   >5.5000000000000000e-01</DOUBLE>
    p.WorhpData.Params.DOUBLE{64}.Attributes.name = 'ReduceBettsTau';
    p.WorhpData.Params.DOUBLE{64}.Text = '5.5000000000000000e-01';
    
    %    <DOUBLE name="RelaxMaxDelta"    >9.2000000000000000e-01</DOUBLE>
    p.WorhpData.Params.DOUBLE{65}.Attributes.name = 'RelaxMaxDelta';
    p.WorhpData.Params.DOUBLE{65}.Text = '9.2000000000000000e-01';
    
    %    <DOUBLE name="RelaxMaxPen"      >1.0000000000000000e+07</DOUBLE>
    p.WorhpData.Params.DOUBLE{66}.Attributes.name = 'RelaxMaxPen';
    p.WorhpData.Params.DOUBLE{66}.Text = '1.0000000000000000e+07';
    
    %    <DOUBLE name="RelaxRho"         >4.8000000000000000e+00</DOUBLE>
    p.WorhpData.Params.DOUBLE{67}.Attributes.name = 'RelaxRho';
    p.WorhpData.Params.DOUBLE{67}.Text = '4.8000000000000000e+00';
    
    %    <DOUBLE name="RelaxStart"       >1.0000000000000000e+00</DOUBLE>
    p.WorhpData.Params.DOUBLE{68}.Attributes.name = 'RelaxStart';
    p.WorhpData.Params.DOUBLE{68}.Text = '1.0000000000000000e+00';
    
    %    <DOUBLE name="ScaleFacObj"      >1.0000000000000000e+01</DOUBLE>
    p.WorhpData.Params.DOUBLE{69}.Attributes.name = 'ScaleFacObj';
    p.WorhpData.Params.DOUBLE{69}.Text = '1.0000000000000000e+01';
    
    %    <DOUBLE name="ScaleFacQP"       >1.0000000000000000e+01</DOUBLE>
    p.WorhpData.Params.DOUBLE{70}.Attributes.name = 'ScaleFacQP';
    p.WorhpData.Params.DOUBLE{70}.Text = '1.0000000000000000e+01';
    
    %    <DOUBLE name="StartBettsTau"    >9.2000000000000000e-04</DOUBLE>
    p.WorhpData.Params.DOUBLE{71}.Attributes.name = 'StartBettsTau';
    p.WorhpData.Params.DOUBLE{71}.Text = '9.2000000000000000e-04';
    
    %    <DOUBLE name="SwitchingDelta"   >1.0000000000000000e-02</DOUBLE>
    p.WorhpData.Params.DOUBLE{72}.Attributes.name = 'SwitchingDelta';
    p.WorhpData.Params.DOUBLE{72}.Text = '1.0000000000000000e-02';
    
    %    <DOUBLE name="SwitchingSCV"     >1.1000000000000000e+00</DOUBLE>
    p.WorhpData.Params.DOUBLE{73}.Attributes.name = 'SwitchingSCV';
    p.WorhpData.Params.DOUBLE{73}.Text = '1.1000000000000000e+00';
    
    %    <DOUBLE name="SwitchingSF"      >1.1000000000000000e+00</DOUBLE>
    p.WorhpData.Params.DOUBLE{74}.Attributes.name = 'SwitchingSF';
    p.WorhpData.Params.DOUBLE{74}.Text = '1.1000000000000000e+00';
    
    %    <DOUBLE name="Timeout"          >3.6000000000000000e+03</DOUBLE>
    p.WorhpData.Params.DOUBLE{75}.Attributes.name = 'Timeout';
    p.WorhpData.Params.DOUBLE{75}.Text = '3.6000000000000000e+03';
    
    %    <DOUBLE name="TolComp"          >1.0000000000000000e-06</DOUBLE>
    p.WorhpData.Params.DOUBLE{76}.Attributes.name = 'TolComp';
    p.WorhpData.Params.DOUBLE{76}.Text = '1.0000000000000000e-06';
    
    %    <DOUBLE name="TolFeas"          >1.0000000000000000e-08</DOUBLE>
    p.WorhpData.Params.DOUBLE{77}.Attributes.name = 'TolFeas';
    p.WorhpData.Params.DOUBLE{77}.Text = '1.0000000000000000e-08';
    
    %    <DOUBLE name="TolOpti"          >1.0000000000000000e-08</DOUBLE>
    p.WorhpData.Params.DOUBLE{78}.Attributes.name = 'TolOpti';
    p.WorhpData.Params.DOUBLE{78}.Text = '1.0000000000000000e-08';
    
    %    <DOUBLE name="TolWeakActive"    >1.0000000000000000e-00</DOUBLE>
    p.WorhpData.Params.DOUBLE{79}.Attributes.name = 'TolWeakActive';
    p.WorhpData.Params.DOUBLE{79}.Text = '1.0000000000000000e-00';
    
    %    <DOUBLE name="TooBigCV"         >1.0000000000000000e+25</DOUBLE>
    p.WorhpData.Params.DOUBLE{80}.Attributes.name = 'TooBigCV';
    p.WorhpData.Params.DOUBLE{80}.Text = '1.0000000000000000e+25';
    
    %    <DOUBLE name="TooBigKKT"        >1.0000000000000000e+30</DOUBLE>
    p.WorhpData.Params.DOUBLE{81}.Attributes.name = 'TooBigKKT';
    p.WorhpData.Params.DOUBLE{81}.Text = '1.0000000000000000e+30';
        
    % <DOUBLE name="MA97small"        >1.0e-20</DOUBLE>
    p.WorhpData.Params.DOUBLE{82}.Attributes.name = 'MA97small';
    p.WorhpData.Params.DOUBLE{82}.Text = '1.0e-20';
    
    % <DOUBLE name="MA97u"            >1.0000000000000000e-10</DOUBLE>
    p.WorhpData.Params.DOUBLE{83}.Attributes.name = 'MA97u';
    p.WorhpData.Params.DOUBLE{83}.Text = '1.0000000000000000e-10';
    
    %    <DOUBLE name="RefineStartTol"   >1.0000000000000000e-06</DOUBLE>
    p.WorhpData.Params.DOUBLE{84}.Attributes.name = 'RefineStartTol';
    p.WorhpData.Params.DOUBLE{84}.Text = '1.0000000000000000e-06';
    
    %    <DOUBLE name="RefineMaxRelax"   >9.5000000000000000e-01</DOUBLE>
    p.WorhpData.Params.DOUBLE{85}.Attributes.name = 'RefineMaxRelax';
    p.WorhpData.Params.DOUBLE{85}.Text = '9.5000000000000000e-01';
    
    %    <DOUBLE name="RefineMaxHMReg"   >1.0000000000000000e+03</DOUBLE>
    p.WorhpData.Params.DOUBLE{86}.Attributes.name = 'RefineMaxHMReg';
    p.WorhpData.Params.DOUBLE{86}.Text = '1.0000000000000000e+03';
    
    %    <DOUBLE name="CrossoverTol"   >1.0000000000000000e+01</DOUBLE>
    p.WorhpData.Params.DOUBLE{87}.Attributes.name = 'CrossoverTol';
    p.WorhpData.Params.DOUBLE{87}.Text = '1.0000000000000000e+01';
    
    %    <DOUBLE name="CheckDerivTolAbs"   >1.0000000000000000e-03</DOUBLE>
    p.WorhpData.Params.DOUBLE{88}.Attributes.name = 'CheckDerivTolAbs';
    p.WorhpData.Params.DOUBLE{88}.Text = '1.0000000000000000e-03';
    
    %    <DOUBLE name="CheckDerivTolRel"   >1.0000000000000000e-03</DOUBLE>
    p.WorhpData.Params.DOUBLE{89}.Attributes.name = 'CheckDerivTolRel';
    p.WorhpData.Params.DOUBLE{89}.Text = '1.0000000000000000e-03';
    
    %    <DOUBLE name="SwitchModeIpComTol"   >4.0000000000000000e-05</DOUBLE>
    p.WorhpData.Params.DOUBLE{90}.Attributes.name = 'SwitchModeIpComTol';
    p.WorhpData.Params.DOUBLE{90}.Text = '4.0000000000000000e-05';
    
    %    <DOUBLE name="SwitchModeIpResTol"   >4.0000000000000000e-06</DOUBLE>
    p.WorhpData.Params.DOUBLE{91}.Attributes.name = 'SwitchModeIpResTol';
    p.WorhpData.Params.DOUBLE{91}.Text = '4.0000000000000000e-06';
    
    %    <DOUBLE name="SwitchModeLsTol"   >1.0000000000000000e-07</DOUBLE>
    p.WorhpData.Params.DOUBLE{92}.Attributes.name = 'SwitchModeLsTol';
    p.WorhpData.Params.DOUBLE{92}.Text = '4.0000000000000000e-05';
    
    %    <DOUBLE name="SwitchModeTermTol"   >1.0000000000000000e-03</DOUBLE>
    p.WorhpData.Params.DOUBLE{93}.Attributes.name = 'SwitchModeTermTol';
    p.WorhpData.Params.DOUBLE{93}.Text = '4.0000000000000000e-05';
    
    %    <DOUBLE name="ArmijoBetaAres"   >8.9500000000000000e-01</DOUBLE>
    p.WorhpData.Params.DOUBLE{94}.Attributes.name = 'ArmijoBetaAres';
    p.WorhpData.Params.DOUBLE{94}.Text = '8.9500000000000000e-01';
    
    %    <DOUBLE name="RefineContrLimitc"   >8.0000000000000000e-01</DOUBLE>
    p.WorhpData.Params.DOUBLE{95}.Attributes.name = 'RefineContrLimitc';
    p.WorhpData.Params.DOUBLE{95}.Text = '8.0000000000000000e-01';
    
    %    <DOUBLE name="RefineContrLimitq"   >1.0000000000000000e-03</DOUBLE>
    p.WorhpData.Params.DOUBLE{96}.Attributes.name = 'RefineContrLimitq';
    p.WorhpData.Params.DOUBLE{96}.Text = '1.0000000000000000e-03';
    
    %    <DOUBLE name="PostQPSensRelaxFrac"   >7.5000000000000000e-01</DOUBLE>
    p.WorhpData.Params.DOUBLE{97}.Attributes.name = 'PostQPSensRelaxFrac';
    p.WorhpData.Params.DOUBLE{97}.Text = '7.5000000000000000e-01';
    
    %    <DOUBLE name="PostQPSensRegValFrac"   >7.5000000000000000e-01</DOUBLE>
    p.WorhpData.Params.DOUBLE{98}.Attributes.name = 'PostQPSensRegValFrac';
    p.WorhpData.Params.DOUBLE{98}.Text = '7.5000000000000000e-01';
    
    %    <DOUBLE name="PostQPSensRegValObjDev"   >1.0000000000000000e-01</DOUBLE>
    p.WorhpData.Params.DOUBLE{99}.Attributes.name = 'PostQPSensRegValObjDev';
    p.WorhpData.Params.DOUBLE{99}.Text = '1.0000000000000000e-01';
    
    %    <DOUBLE name="IP_NlpObjUp"   >1.0000000000000000e+20</DOUBLE>
    p.WorhpData.Params.DOUBLE{100}.Attributes.name = 'IP_NlpObjUp';
    p.WorhpData.Params.DOUBLE{100}.Text = '1.0000000000000000e+20';
    
    %    <DOUBLE name="IP_BarrierInit"   >1.0000000000000000e-01</DOUBLE>
    p.WorhpData.Params.DOUBLE{101}.Attributes.name = 'IP_BarrierInit';
    p.WorhpData.Params.DOUBLE{101}.Text = '1.0000000000000000e-01';
    
    %    <DOUBLE name="IP_BarrierShiftInit"   >1.0000000000000000e-03</DOUBLE>
    p.WorhpData.Params.DOUBLE{102}.Attributes.name = 'IP_BarrierShiftInit';
    p.WorhpData.Params.DOUBLE{102}.Text = '1.0000000000000000e-03';
    
    %    <DOUBLE name="IP_PenaltySwitch"   >1.0000000000000000e+04</DOUBLE>
    p.WorhpData.Params.DOUBLE{103}.Attributes.name = 'IP_PenaltySwitch';
    p.WorhpData.Params.DOUBLE{103}.Text = '1.0000000000000000e+04';
    
    %    <DOUBLE name="IP_PenaltySwitch"   >1.0000000000000000e+04</DOUBLE>
    p.WorhpData.Params.DOUBLE{104}.Attributes.name = 'IP_PenaltySwitch';
    p.WorhpData.Params.DOUBLE{104}.Text = '1.0000000000000000e+04';
    
    %    <DOUBLE name="IP_PenaltyInit"   >1.0000000000000000e+02</DOUBLE>
    p.WorhpData.Params.DOUBLE{105}.Attributes.name = 'IP_PenaltyInit';
    p.WorhpData.Params.DOUBLE{105}.Text = '1.0000000000000000e+02';
    
    %    <DOUBLE name="IP_InitDual"   >0.0000000000000000e+00</DOUBLE>
    p.WorhpData.Params.DOUBLE{106}.Attributes.name = 'IP_InitDual';
    p.WorhpData.Params.DOUBLE{106}.Text = '0.0000000000000000e+00';
    
    %    <DOUBLE name="IP_InitDualBox"   >1.0000000000000000e+00</DOUBLE>
    p.WorhpData.Params.DOUBLE{107}.Attributes.name = 'IP_InitDualBox';
    p.WorhpData.Params.DOUBLE{107}.Text = '1.0000000000000000e+00';
    
    %    <DOUBLE name="IP_InitBoundDistAbs"   >1.0000000000000000e-02</DOUBLE>
    p.WorhpData.Params.DOUBLE{108}.Attributes.name = 'IP_InitBoundDistAbs';
    p.WorhpData.Params.DOUBLE{108}.Text = '1.0000000000000000e-02';
    
    %    <DOUBLE name="IP_InitBoundDistRel"   >1.0000000000000000e-02</DOUBLE>
    p.WorhpData.Params.DOUBLE{109}.Attributes.name = 'IP_InitBoundDistRel';
    p.WorhpData.Params.DOUBLE{109}.Text = '1.0000000000000000e-02';
    
    %    <DOUBLE name="IP_InitBoundDistSAbs"   >1.0000000000000000e-02</DOUBLE>
    p.WorhpData.Params.DOUBLE{110}.Attributes.name = 'IP_InitBoundDistSAbs';
    p.WorhpData.Params.DOUBLE{110}.Text = '1.0000000000000000e-02';
    
    %    <DOUBLE name="IP_InitBoundDistSRel"   >1.0000000000000000e-02</DOUBLE>
    p.WorhpData.Params.DOUBLE{111}.Attributes.name = 'IP_InitBoundDistSRel';
    p.WorhpData.Params.DOUBLE{111}.Text = '1.0000000000000000e-02';
    
    %    <DOUBLE name="IP_InitBoundDistDual"   >1.0000000000000000e-02</DOUBLE>
    p.WorhpData.Params.DOUBLE{112}.Attributes.name = 'IP_InitBoundDistDual';
    p.WorhpData.Params.DOUBLE{112}.Text = '1.0000000000000000e-02';
    
    %    <DOUBLE name="IP_WarmDual"   >0.0000000000000000e+00</DOUBLE>
    p.WorhpData.Params.DOUBLE{113}.Attributes.name = 'IP_WarmDual';
    p.WorhpData.Params.DOUBLE{113}.Text = '0.0000000000000000e+00';
    
    %    <DOUBLE name="IP_WarmDualBox"   >1.0000000000000000e+00</DOUBLE>
    p.WorhpData.Params.DOUBLE{114}.Attributes.name = 'IP_WarmDualBox';
    p.WorhpData.Params.DOUBLE{114}.Text = '1.0000000000000000e+00';
    
    %    <DOUBLE name="IP_WarmBoundDistAbs"   >1.0000000000000000e-03</DOUBLE>
    p.WorhpData.Params.DOUBLE{115}.Attributes.name = 'IP_WarmBoundDistAbs';
    p.WorhpData.Params.DOUBLE{115}.Text = '1.0000000000000000e-03';
    
    %    <DOUBLE name="IP_WarmBoundDistRel"   >1.0000000000000000e-03</DOUBLE>
    p.WorhpData.Params.DOUBLE{116}.Attributes.name = 'IP_WarmBoundDistRel';
    p.WorhpData.Params.DOUBLE{116}.Text = '1.0000000000000000e-03';
    
    %    <DOUBLE name="IP_WarmBoundDistSAbs"   >1.0000000000000000e-03</DOUBLE>
    p.WorhpData.Params.DOUBLE{117}.Attributes.name = 'IP_WarmBoundDistSAbs';
    p.WorhpData.Params.DOUBLE{117}.Text = '1.0000000000000000e-03';
    
    %    <DOUBLE name="IP_WarmBoundDistSRel"   >1.0000000000000000e-03</DOUBLE>
    p.WorhpData.Params.DOUBLE{118}.Attributes.name = 'IP_WarmBoundDistSRel';
    p.WorhpData.Params.DOUBLE{118}.Text = '1.0000000000000000e-03';
    
    %    <DOUBLE name="IP_WarmBoundDistDual"   >1.0000000000000000e-03</DOUBLE>
    p.WorhpData.Params.DOUBLE{119}.Attributes.name = 'IP_WarmBoundDistDual';
    p.WorhpData.Params.DOUBLE{119}.Text = '1.0000000000000000e-03';
    
    %    <DOUBLE name="IP_LeqItRefTol"   >1.0000000000000000e-10</DOUBLE>
    p.WorhpData.Params.DOUBLE{120}.Attributes.name = 'IP_LeqItRefTol';
    p.WorhpData.Params.DOUBLE{120}.Text = '1.0000000000000000e-10';
    
    %    <DOUBLE name="IP_LeqItRefImprFac"   >9.9999999990000000e-01</DOUBLE>
    p.WorhpData.Params.DOUBLE{121}.Attributes.name = 'IP_LeqItRefImprFac';
    p.WorhpData.Params.DOUBLE{121}.Text = '9.9999999990000000e-01';
    
    %    <DOUBLE name="IP_LineArmijoBeta"   >5.0000000000000000e-01</DOUBLE>
    p.WorhpData.Params.DOUBLE{122}.Attributes.name = 'IP_LineArmijoBeta';
    p.WorhpData.Params.DOUBLE{122}.Text = '5.0000000000000000e-01';
    
    %    <DOUBLE name="IP_LineAlphaMax"   >1.0000000000000000e+00</DOUBLE>
    p.WorhpData.Params.DOUBLE{123}.Attributes.name = 'IP_LineAlphaMax';
    p.WorhpData.Params.DOUBLE{123}.Text = '1.0000000000000000e+00';
    
    %    <DOUBLE name="IP_LineAlphaMin"   >1.0000000000000000e-12</DOUBLE>
    p.WorhpData.Params.DOUBLE{124}.Attributes.name = 'IP_LineAlphaMin';
    p.WorhpData.Params.DOUBLE{124}.Text = '1.0000000000000000e-12';
    
    %    <DOUBLE name="IP_LineInterpMin"   >9.5000000000000000e-01</DOUBLE>
    p.WorhpData.Params.DOUBLE{125}.Attributes.name = 'IP_LineInterpMin';
    p.WorhpData.Params.DOUBLE{125}.Text = '9.5000000000000000e-01';
    
    %    <DOUBLE name="MA97umax"   >1.0000000000000000e-04</DOUBLE>
    p.WorhpData.Params.DOUBLE{126}.Attributes.name = 'MA97umax';
    p.WorhpData.Params.DOUBLE{126}.Text = '1.0000000000000000e-04';
    
    %% VEC
    p.WorhpData.Params.VEC.Attributes.name = 'Ares';
    p.WorhpData.Params.VEC.Attributes.kind = 'int';
    p.WorhpData.Params.VEC.Attributes.dim  = '7';
    p.WorhpData.Params.VEC.Elem{1}.Attributes.i = '0';
    p.WorhpData.Params.VEC.Elem{1}.Text = '42';
    p.WorhpData.Params.VEC.Elem{2}.Attributes.i = '1';
    p.WorhpData.Params.VEC.Elem{2}.Text = '41';
    p.WorhpData.Params.VEC.Elem{3}.Attributes.i = '2';
    p.WorhpData.Params.VEC.Elem{3}.Text = '42';
    p.WorhpData.Params.VEC.Elem{4}.Attributes.i = '3';
    p.WorhpData.Params.VEC.Elem{4}.Text = '43';
    p.WorhpData.Params.VEC.Elem{5}.Attributes.i = '4';
    p.WorhpData.Params.VEC.Elem{5}.Text = '44';
    p.WorhpData.Params.VEC.Elem{6}.Attributes.i = '5';
    p.WorhpData.Params.VEC.Elem{6}.Text = '41';
    p.WorhpData.Params.VEC.Elem{7}.Attributes.i = '6';
    p.WorhpData.Params.VEC.Elem{7}.Text = '50';
        
end

