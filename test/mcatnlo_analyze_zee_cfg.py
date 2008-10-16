import FWCore.ParameterSet.Config as cms

process = cms.Process("myprocess")
process.maxEvents = cms.untracked.PSet(
    input = cms.untracked.int32(-1)
)
process.source = cms.Source("PoolSource",
    fileNames = cms.untracked.vstring('file:zee_mcatnlo.root')
)

process.myanalysis = cms.EDAnalyzer("ZeeAnalyzer",
    OutputFilename = cms.untracked.string('zee_histos.root')
)

process.p = cms.Path(process.myanalysis)


