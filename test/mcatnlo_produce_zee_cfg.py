import FWCore.ParameterSet.Config as cms

process = cms.Process("TEST")
process.maxEvents = cms.untracked.PSet(
    output = cms.untracked.int32(100)
)
process.source = cms.Source("MCatNLOSource",
    HerwigParameters = cms.PSet(
        defaultHerwig = cms.vstring(),
        parameterSets = cms.vstring('defaultHerwig')
    ),
    doMPInteraction = cms.untracked.bool(True),
    processNumber = cms.untracked.int32(-1361),
    herwigHepMCVerbosity = cms.untracked.bool(False),
    doHardEvents = cms.untracked.bool(True),
    herwigVerbosity = cms.untracked.int32(0),
    MCatNLOParameters = cms.PSet(
        mcatnloReadin = cms.vstring('TWIDTH=1.4', 
            'ECM=14000', 
            'FREN=1', 
            'FFACT=1', 
            'HVQMASS=175', 
            'WMASS=80', 
            'WWIDTH=2.124', 
            'ZMASS=91.17', 
            'ZWIDTH=2.495', 
            'HGGMASS=165', 
            'HGGWIDTH=1.04', 
            'IBORNHGG=1', 
            'V1GAMMAX=30', 
            'V1MASSINF=0', 
            'V1MASSSUP=0', 
            'V2GAMMAX=30', 
            'V2MASSINF=0', 
            'V2MASSSUP=0', 
            'HGAMMAX=30', 
            'HMASSINF=0', 
            'HMASSSUP=0', 
            'UMASS=0.32', 
            'DMASS=0.32', 
            'SMASS=0.5', 
            'CMASS=1.55', 
            'BMASS=4.95', 
            'GMASS=0.75', 
            'VUD=0.9748', 
            'VUS=0.2225', 
            'VUB=0.0036', 
            'VCD=0.2225', 
            'VCS=0.9740', 
            'VCB=0.041 ', 
            'VTD=0.009 ', 
            'VTS=0.0405', 
            'VTB=0.9992', 
            'AEMRUN=YES', 
            'IVCODE=1', 
            'IL1CODE=1', 
            'IL2CODE=1', 
            'PDFGROUP=LHAPDF', 
            'PDFSET=20060', 
            'LAMBDAFIVE=1', 
            'SCHEMEOFPDF=MS', 
            'LAMBDAHERW=-1', 
            'FPREFIX=zee', 
            'EVPREFIX=zee', 
            'WGTTYPE=1', 
            'PDFLIBRARY=HWLHAPDF', 
            'HERPDF=EXTPDF', 
            'LHAPATH="/home/xv/fabstoec/LHAPDF"', 
            'LHAOFL=FREEZE'),
        parameterSets = cms.vstring('mcatnloReadin')
    ),
    mcatnloVerbosity = cms.untracked.int32(0),
    lhapdfSetPath = cms.untracked.string(''),
    printCards = cms.untracked.bool(False),
    numHardEvents = cms.untracked.int32(110),
    maxEventsToPrint = cms.untracked.int32(0),
    stringFileName = cms.untracked.string('stringInput.txt'),
    useJimmy = cms.untracked.bool(True)
)

process.RandomNumberGeneratorService = cms.Service("RandomNumberGeneratorService",
    theSource = cms.PSet(
        initialSeed = cms.untracked.uint32(123456789),
        engineName = cms.untracked.string('HepJamesRandom')
    )
)

process.filter = cms.EDFilter("MCatNLOFilter")

process.out = cms.OutputModule("PoolOutputModule",
    SelectEvents = cms.untracked.PSet(
        SelectEvents = cms.vstring('p1')
    ),
    fileName = cms.untracked.string('zee_mcatnlo.root')
)

process.p1 = cms.Path(process.filter)
process.p = cms.EndPath(process.out)


