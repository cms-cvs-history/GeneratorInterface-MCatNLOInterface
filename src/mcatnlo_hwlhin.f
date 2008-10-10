C Collects all of the Les Houches interface routines, plus utilities
C for colour codes
C
C----------------------------------------------------------------------
      SUBROUTINE UPEVNT
C----------------------------------------------------------------------
C  Reads MC@NLO input files and fills Les Houches event common HEPEUP
C----------------------------------------------------------------------
C      INCLUDE 'HERWIG65.INC'


      IMPLICIT NONE
      DOUBLE PRECISION ZERO,ONE,TWO,THREE,FOUR,HALF
      PARAMETER (ZERO =0.D0, ONE =1.D0, TWO =2.D0,
     &           THREE=3.D0, FOUR=4.D0, HALF=0.5D0)
C
      DOUBLE PRECISION
     & ACCUR,AFCH,ALPFAC,ALPHEM,ANOMSC,ASFIXD,AVWGT,B1LIM,BETAF,BRFRAC,
     & BRHIG,BTCLM,CAFAC,CFFAC,CLDKWT,CLMAX,CLPOW,CLQ,CLSMR,CMMOM,COSS,
     & COSTH,CSPEED,CTHRPW,CTMAX,DECPAR,DECWT,DISF,DKLTM,EBEAM1,EBEAM2,
     & EMLST,EMMAX,EMMIN,EMPOW,EMSCA,ENHANC,ENSOF,EPOLN,ETAMIX,EVWGT,
     & EXAG,F0MIX,F1MIX,F2MIX,GAMH,GAMMAX,GAMW,GAMWT,GAMZ,GAMZP,GCOEF,
     & GEV2NB,GEV2MM,GPOLN,H1MIX,HBAR,HARDST,OMEGA0,PBEAM1,PBEAM2,PDIQK,
     & PGSMX,PGSPL,PHEP,PHIMIX,PHIPAR,PHOMAS,PIFAC,PLTCUT,PPAR,PPOLN,
     & PRECO,PRSOF,PSPLT,PTINT,PTMAX,PTMIN,PTPOW,PTRMS,PXRMS,PWT,Q2MAX,
     & Q2MIN,Q2POW,Q2WWMN,Q2WWMX,QCDL3,QCDL5,QCDLAM,QDIQK,QEV,QFCH,QG,
     & QLIM,QSPAC,QV,QWT,REPWT,RESN,RHOHEP,RHOPAR,RLTIM,RMASS,RMIN,
     & RSPIN,SCABI,SINS,SNGWT,SWEIN,SWTEF,SUD,THMAX,TLOUT,TMTOP,TMNISR,
     & TQWT,VCKM,VFCH,VGCUT,VHEP,VMIN2,VPAR,VPCUT,VQCUT,VTXPIP,VTXQDK,
     & WBIGST,WGTMAX,WGTSUM,WHMIN,WSQSUM,XFACT,XLMIN,XMIX,XMRCT,XX,
     & XXMIN,YBMAX,YBMIN,YJMAX,YJMIN,YMIX,YMRCT,YWWMAX,YWWMIN,ZBINM,
     & ZJMAX,ZMXISR,Y4JT,EFFMIN,PPCL,
     & TANB,ALPHAH,COSBPA,SINBPA,COSBMA,SINBMA,COSA,SINA,COSB,SINB,COTB,
     & ZMIXSS,ZMXNSS,ZSGNSS,LFCH,RFCH,SLFCH,SRFCH, WMXUSS,WMXVSS,WSGNSS,
     & QMIXSS,LMIXSS,THETAT,THETAB,THETAL,ATSS,ABSS,ALSS,MUSS,FACTSS,
     & GHWWSS,GHZZSS,GHDDSS,GHUUSS,GHWHSS,GHSQSS
C--fix by PR 12/7/02 to avoid problems with nag compiler
       DOUBLE PRECISION	
     & XLMNSS,RMMNSS,DMSSM,SENHNC,SSPARITY,LAMDA1,LAMDA2,LAMDA3,
     & PMBN1,PMBN2,PMBN3,PMBK1,PMBK2,PMBM1,PMBM2,PMBP1,PMBP2,PMBP3,
     & OMHMIX,ET2MIX,PH3MIX,GCUTME
C
      INTEGER
     & CLDIR,IAPHIG,IBRN,IBSH,ICHRG,ICO,IDCMF,IDHEP,IDHW,IDK,IDKPRD,IDN,
     & IDPAR,IDPDG,IERROR,IFLAV,IFLMAX,IFLMIN,IHPRO,IMQDK,INHAD,INTER,
     & IOPDKL,IOPHIG,IOPREM,IPART1,IPART2,IPRINT,IPRO,IPROC,ISLENT,
     & ISPAC,ISTAT,ISTHEP,ISTPAR,JCOPAR,JDAHEP,JDAPAR,JMOHEP,JMOPAR,
     & JNHAD,LNEXT,LOCN,LOCQ,LRSUD,LSTRT,LWEVT,LWSUD,MAPQ,MAXER,MAXEV,
     & MAXFL,MAXPR,MODBOS,MODMAX,MODPDF,NBTRY,NCLDK,NCOLO,NCTRY,NDKYS,
     & NDTRY,NETRY,NEVHEP,NEVPAR,NFLAV,NGSPL,NHEP,NME,NMODES,NMXCDK,
     & NMXDKS,NMXHEP,NMXJET,NMXMOD,NMXPAR,NMXQDK,NMXRES,NMXSUD,NPAR,
     & NPRODS,NQDK,NQEV,NRES,NRN,NSPAC,NSTRU,NSTRY,NSUD,NUMER,NUMERU,
     & NWGTS,NZBIN,SUDORD,IOP4JT,HRDCOL,NMXCL,NCL,IDCL,NPRFMT,NRECO
C
      LOGICAL
     & AZSOFT,AZSPIN,BGSHAT,BREIT,CLRECO,COLISR,DKPSET,FROST,FSTEVT,
     & FSTWGT,GENEV,GENSOF,HARDME,HVFCEN,MAXDKL,MIXING,NOSPAC,NOWGT,
     & PRNDEC,PIPSMR,PRVTX,RSTAB,SOFTME,TMPAR,TPOL,USECMF,VTOCDK,VTORDK,
     & ZPRIME,RPARTY,COLUPD,PRNDEF,PRNTEX,PRNWEB,DURHAM,SUSYIN,
     & QORQQB,QBORQQ
C
      CHARACTER*4
     & BDECAY
      CHARACTER*8
     & PART1,PART2,RNAME
      CHARACTER*20
     & AUTPDF
      CHARACTER*37
     & TXNAME
C
C New standard event common
      PARAMETER (NMXHEP=4000)
      COMMON/HEPEVT/NEVHEP,NHEP,ISTHEP(NMXHEP),IDHEP(NMXHEP),
     & JMOHEP(2,NMXHEP),JDAHEP(2,NMXHEP),PHEP(5,NMXHEP),VHEP(4,NMXHEP)
C
C Beams, process and number of events
      COMMON/HWBEAM/IPART1,IPART2
      COMMON/HWBMCH/PART1,PART2
      COMMON/HWPROC/EBEAM1,EBEAM2,PBEAM1,PBEAM2,IPROC,MAXEV
C
C Basic parameters (and quantities derived from them)
      COMMON/HWPRAM/AFCH(16,2),ALPHEM,B1LIM,BETAF,BTCLM,CAFAC,CFFAC,
     & CLMAX,CLPOW,CLSMR(2),CSPEED,ENSOF,ETAMIX,F0MIX,F1MIX,F2MIX,GAMH,
     & GAMW,GAMZ,GAMZP,GEV2NB,H1MIX,PDIQK,PGSMX,PGSPL(4),PHIMIX,PIFAC,
     & PRSOF,PSPLT(2),PTRMS,PXRMS,QCDL3,QCDL5,QCDLAM,QDIQK,QFCH(16),QG,
     & QSPAC,QV,SCABI,SWEIN,TMTOP,VFCH(16,2),VCKM(3,3),VGCUT,VQCUT,
     & VPCUT,ZBINM,EFFMIN,OMHMIX,ET2MIX,PH3MIX,GCUTME,
     & IOPREM,IPRINT,ISPAC,LRSUD,LWSUD,MODPDF(2),NBTRY,NCOLO,NCTRY,
     & NDTRY,NETRY,NFLAV,NGSPL,NSTRU,NSTRY,NZBIN,IOP4JT(2),NPRFMT,
     & AZSOFT,AZSPIN,CLDIR(2),HARDME,NOSPAC,PRNDEC,PRVTX,SOFTME,ZPRIME,
     & PRNDEF,PRNTEX,PRNWEB
C
      COMMON/HWPRCH/AUTPDF(2),BDECAY
C
C Parton shower common (same format as /HEPEVT/)
      PARAMETER (NMXPAR=500)
      COMMON/HWPART/NEVPAR,NPAR,ISTPAR(NMXPAR),IDPAR(NMXPAR),
     & JMOPAR(2,NMXPAR),JDAPAR(2,NMXPAR),PPAR(5,NMXPAR),VPAR(4,NMXPAR)
C
C Parton polarization common
      COMMON/HWPARP/DECPAR(2,NMXPAR),PHIPAR(2,NMXPAR),RHOPAR(2,NMXPAR),
     & TMPAR(NMXPAR)
C
C Electroweak boson common
      PARAMETER (MODMAX=50)
      COMMON/HWBOSC/ALPFAC,BRHIG(12),ENHANC(12),GAMMAX,RHOHEP(3,NMXHEP),
     & IOPHIG,MODBOS(MODMAX)
C
C Parton colour common
      COMMON/HWPARC/JCOPAR(4,NMXPAR)
C
C other HERWIG branching, event and hard subprocess common blocks
      COMMON/HWBRCH/ANOMSC(2,2),HARDST,PTINT(3,2),XFACT,INHAD,JNHAD,
     & NSPAC(7),ISLENT,BREIT,FROST,USECMF
C
      COMMON/HWEVNT/AVWGT,EVWGT,GAMWT,TLOUT,WBIGST,WGTMAX,WGTSUM,WSQSUM,
     & IDHW(NMXHEP),IERROR,ISTAT,LWEVT,MAXER,MAXPR,NOWGT,NRN(2),NUMER,
     & NUMERU,NWGTS,GENSOF
C
      COMMON/HWHARD/ASFIXD,CLQ(7,6),COSS,COSTH,CTMAX,DISF(13,2),EMLST,
     & EMMAX,EMMIN,EMPOW,EMSCA,EPOLN(3),GCOEF(7),GPOLN,OMEGA0,PHOMAS,
     & PPOLN(3),PTMAX,PTMIN,PTPOW,Q2MAX,Q2MIN,Q2POW,Q2WWMN,Q2WWMX,QLIM,
     & SINS,THMAX,Y4JT,TMNISR,TQWT,XX(2),XLMIN,XXMIN,YBMAX,YBMIN,YJMAX,
     & YJMIN,YWWMAX,YWWMIN,WHMIN,ZJMAX,ZMXISR,IAPHIG,IBRN(2),IBSH,
     & ICO(10),IDCMF,IDN(10),IFLMAX,IFLMIN,IHPRO,IPRO,MAPQ(6),MAXFL,
     & BGSHAT,COLISR,FSTEVT,FSTWGT,GENEV,HVFCEN,TPOL,DURHAM
C
C Arrays for particle properties (NMXRES = max no of particles defined)
      PARAMETER(NMXRES=500)
      COMMON/HWPROP/RLTIM(0:NMXRES),RMASS(0:NMXRES),RSPIN(0:NMXRES),
     & ICHRG(0:NMXRES),IDPDG(0:NMXRES),IFLAV(0:NMXRES),NRES,
     & VTOCDK(0:NMXRES),VTORDK(0:NMXRES),
     & QORQQB(0:NMXRES),QBORQQ(0:NMXRES)
C
      COMMON/HWUNAM/RNAME(0:NMXRES),TXNAME(2,0:NMXRES)
C
C Arrays for particle decays (NMXDKS = max total no of decays,
C                             NMXMOD = max no of modes for a particle)
      PARAMETER(NMXDKS=4000,NMXMOD=200)
      COMMON/HWUPDT/BRFRAC(NMXDKS),CMMOM(NMXDKS),DKLTM(NMXRES),
     & IDK(NMXDKS),IDKPRD(5,NMXDKS),LNEXT(NMXDKS),LSTRT(NMXRES),NDKYS,
     & NME(NMXDKS),NMODES(NMXRES),NPRODS(NMXDKS),DKPSET,RSTAB(0:NMXRES)
C
C Weights used in cluster decays
      COMMON/HWUWTS/REPWT(0:3,0:4,0:4),SNGWT,DECWT,QWT(3),PWT(12),
     & SWTEF(NMXRES)
C
C Parameters for cluster decays (NMXCDK = max total no of cluster
C                                         decay channels)
      PARAMETER(NMXCDK=4000)
      COMMON/HWUCLU/CLDKWT(NMXCDK),CTHRPW(12,12),PRECO,RESN(12,12),
     & RMIN(12,12),LOCN(12,12),NCLDK(NMXCDK),NRECO,CLRECO
C
C Variables controling mixing and vertex information
C--VTXPIP should have been a 5-vector, problems with NAG compiler
      COMMON/HWDIST/EXAG,GEV2MM,HBAR,PLTCUT,VMIN2,VTXPIP(5),XMIX(2),
     & XMRCT(2),YMIX(2),YMRCT(2),IOPDKL,MAXDKL,MIXING,PIPSMR
C
C Arrays for temporarily storing heavy-b,c-hadrons decaying partonicaly
C (NMXQDK = max no such decays in an event)
      PARAMETER (NMXQDK=20)
      COMMON/HWQDKS/VTXQDK(4,NMXQDK),IMQDK(NMXQDK),LOCQ(NMXQDK),NQDK
C
C Parameters for Sudakov form factors
C (NMXSUD= max no of entries in lookup table)
      PARAMETER (NMXSUD=1024)
      COMMON/HWUSUD/ACCUR,QEV(NMXSUD,6),SUD(NMXSUD,6),INTER,NQEV,NSUD,
     & SUDORD
C
      PARAMETER (NMXJET=200)
C
C SUSY parameters
      COMMON/HWSUSY/
     & TANB,ALPHAH,COSBPA,SINBPA,COSBMA,SINBMA,COSA,SINA,COSB,SINB,COTB,
     & ZMIXSS(4,4),ZMXNSS(4,4),ZSGNSS(4), LFCH(16),RFCH(16),
     & SLFCH(16,4),SRFCH(16,4), WMXUSS(2,2),WMXVSS(2,2), WSGNSS(2),
     & QMIXSS(6,2,2),LMIXSS(6,2,2),
     & THETAT,THETAB,THETAL,ATSS,ABSS,ALSS,MUSS,FACTSS,
     & GHWWSS(3),GHZZSS(3),GHDDSS(4),GHUUSS(4),GHWHSS(3),
     & GHSQSS(4,6,2,2),XLMNSS,RMMNSS,DMSSM,SENHNC(24),SSPARITY,SUSYIN
C
C R-Parity violating parameters and colours
      COMMON /HWRPAR/ LAMDA1(3,3,3),LAMDA2(3,3,3),
     &                LAMDA3(3,3,3),HRDCOL(2,5),RPARTY,COLUPD
C
C Parameters for minimum bias/soft underlying event
      COMMON/HWMINB/
     & PMBN1,PMBN2,PMBN3,PMBK1,PMBK2,PMBM1,PMBM2,PMBP1,PMBP2,PMBP3
C
C Cluster common used by soft event routines
      PARAMETER (NMXCL=500)
      COMMON/HWCLUS/PPCL(5,NMXCL),IDCL(NMXCL),NCL
C
C  Parameters for resonant graviton production
      DOUBLE PRECISION GRVLAM,EMGRV,GAMGRV
      COMMON/HWGRAV/GRVLAM,EMGRV,GAMGRV
C
C  Other new parameters for version 6.2
      DOUBLE PRECISION VIPWID,DXRCYL,DXZMAX,DXRSPH
      LOGICAL WZRFR,FIX4JT
      INTEGER IMSSM,IHIGGS,PARITY,LRSUSY
      COMMON/HW6202/VIPWID(3),DXRCYL,DXZMAX,DXRSPH,WZRFR,FIX4JT,
     & IMSSM,IHIGGS,PARITY,LRSUSY
C
C  New parameters for version 6.203
      DOUBLE PRECISION ABWGT,ABWSUM,AVABW
      INTEGER NNEGWT,NNEGEV
      LOGICAL NEGWTS
      COMMON/HW6203/ABWGT,ABWSUM,AVABW,NNEGWT,NNEGEV,NEGWTS
C
C  New parameters for version 6.3
      INTEGER IMAXCH,IMAXOP
      PARAMETER (IMAXCH=20,IMAXOP=40)
      DOUBLE PRECISION MJJMIN,CHNPRB(IMAXCH)
      INTEGER IOPSTP,IOPSH
      LOGICAL OPTM,CHON(IMAXCH)
      COMMON/HW6300/MJJMIN,CHNPRB,IOPSTP,IOPSH,OPTM,CHON
C  New PDF's for version 6.3
      INTEGER NXMRS,NQMRS,NPMRS
      PARAMETER(NXMRS=49,NQMRS=37,NPMRS=8)
      DOUBLE PRECISION FMRS(3,NPMRS,NXMRS,NQMRS+1)
      COMMON /HWPMRS/FMRS
C  Circe interface for version 6.3
      INTEGER CIRCOP,CIRCAC,CIRCVR,CIRCRV,CIRCCH
      COMMON /HWCIRC/CIRCOP,CIRCAC,CIRCVR,CIRCRV,CIRCCH
C  New parameters and commons for spin correlations
C--constants for the arrays
      INTEGER NMXSPN,NCFMAX
      PARAMETER(NMXSPN=50,NCFMAX=3)
      INTEGER NMODE2,NMODE3,NDIAGR,NMODEB,NMODE4
      PARAMETER(NMODE2=500,NMODE3=500,NDIAGR=8,NMODEB=50,NMODE4=4)
C--common block for X --> X gauge boson
      DOUBLE PRECISION ABMODE(2,NMODEB),BBMODE(2,12,NMODEB),
     & PBMODE(12,NMODEB),WTBMAX(12,NMODEB)
      INTEGER IDBPRT(NMODEB),IBMODE(NMODEB),IBDRTP(NMODEB),NBMODE
      COMMON /HWDSPB/ABMODE,BBMODE,PBMODE,WTBMAX,IDBPRT,IBDRTP,IBMODE,
     & NBMODE
C--common block for two body decays	
      DOUBLE PRECISION A2MODE(2,NMODE2),P2MODE(NMODE2),WT2MAX(NMODE2)
      INTEGER ID2PRT(NMODE2),I2DRTP(NMODE2),N2MODE
      COMMON /HWDSP2/A2MODE,P2MODE,WT2MAX,ID2PRT,I2DRTP,N2MODE
C--common block for three body decays
      DOUBLE PRECISION A3MODE(2,NDIAGR,NMODE3),B3MODE(2,NDIAGR,NMODE3),
     & P3MODE(NMODE3),WT3MAX(NMODE3),SPN3CF(NCFMAX,NCFMAX,NMODE3)
      INTEGER ID3PRT(NMODE3),I3MODE(NDIAGR,NMODE3),
     & I3DRTP(NDIAGR,NMODE3),N3MODE,NDI3BY(NMODE3),N3NCFL(NMODE3),
     &	I3DRCF(NDIAGR,NMODE3)
      COMMON /HWDSP3/A3MODE,B3MODE,P3MODE,WT3MAX,SPN3CF,ID3PRT,I3MODE,
     &	I3DRTP,N3MODE,NDI3BY,N3NCFL,I3DRCF
C--common block for four body decays
      DOUBLE PRECISION A4MODE(2,12,NMODE4),B4MODE(2,12,NMODE4),
     & P4MODE(12,12,NMODE4),WT4MAX(12,12,NMODE4)
      INTEGER ID4PRT(NMODE4),I4MODE(2,NMODE4),N4MODE
      COMMON /HWDSP4/A4MODE,B4MODE,P4MODE,WT4MAX,ID4PRT,I4MODE,N4MODE
C--common block for spin correlations in event
      INTEGER NDECSY,NSEARCH,LRDEC,LWDEC
      LOGICAL SYSPIN,THREEB,FOURB
      CHARACTER *6 TAUDEC
      COMMON /HWDSPN/NDECSY,NSEARCH,LRDEC,LWDEC,SYSPIN,THREEB,
     &	FOURB,TAUDEC
C
      INTEGER IDSPN(NMXSPN),JMOSPN(NMXSPN),JDASPN(2,NMXSPN),NSPN,
     &	ISNHEP(NMXHEP),NSNTRY,NCFL(NMXSPN),SPCOPT
      DOUBLE COMPLEX MESPN(2,2,2,2,NCFMAX,NMXSPN),RHOSPN(2,2,NMXSPN)
      DOUBLE PRECISION SPNCFC(NCFMAX,NCFMAX,NMXSPN)
      LOGICAL DECSPN(NMXSPN)
      COMMON /HWSPIN/MESPN,RHOSPN,SPNCFC,IDSPN,JMOSPN,JDASPN,
     &	NSPN,ISNHEP,NSNTRY,DECSPN,NCFL,SPCOPT
      INTEGER JAK1,JAK2,ITDKRC,IFPHOT
      COMMON /HWSTAU/ JAK1,JAK2,ITDKRC,IFPHOT
C
C--common block for Les Houches interface to store information we need
C
      INTEGER MAXHRP
      PARAMETER (MAXHRP=100)
      DOUBLE PRECISION LHWGT(MAXHRP),LHWGTS(MAXHRP),LHMXSM,
     &     LHXSCT(MAXHRP),LHXERR(MAXHRP),LHXMAX(MAXHRP)
      INTEGER LHIWGT(MAXHRP),ITYPLH,LHNEVT(MAXHRP)
      LOGICAL LHSOFT,LHGLSF	
      COMMON /HWGUPR/LHWGT,LHWGTS,LHXSCT,LHXERR,LHXMAX,LHMXSM,LHIWGT,
     &     LHNEVT,ITYPLH,LHSOFT,LHGLSF
C
C--common block for HERWIG6.5
C
      LOGICAL PRESPL
      COMMON /HW6500/ PRESPL
      INTEGER ITOPRD
      COMMON /HW6504/ITOPRD
C--the only change for 6505 was to increase MODMAX from 5 to 50
      DOUBLE PRECISION PDFX0,PDFPOW
      COMMON /HW6506/PDFX0,PDFPOW
C--add new variable to prevent infinite loops in HWDFOR/FIV
      INTEGER NDETRY
      COMMON /HW6510/NDETRY
CCCC  ====================================================================




C---Les Houches Event Common Block
      INTEGER MAXNUP
      PARAMETER (MAXNUP=500)
      INTEGER NUP,IDPRUP,IDUP,ISTUP,MOTHUP,ICOLUP
      DOUBLE PRECISION XWGTUP,SCALUP,AQEDUP,AQCDUP,PUP,VTIMUP,SPINUP,
     & XMP2,XMA2,XMB2,BETA,VA,VB,SIGMA,DELTA,S2,XKA,XKB,PTF,E,PL,
     & XSCALE
      COMMON/HEPEUP/NUP,IDPRUP,XWGTUP,SCALUP,AQEDUP,AQCDUP,
     &              IDUP(MAXNUP),ISTUP(MAXNUP),MOTHUP(2,MAXNUP),
     &              ICOLUP(2,MAXNUP),PUP(5,MAXNUP),VTIMUP(MAXNUP),
     &              SPINUP(MAXNUP)
      DOUBLE PRECISION PCM(5),PTR,XMTR,HWVDOT,HWULDO,PDB(5)
      INTEGER I,J,IC,JPR,MQQ,NQQ,IUNIT,ISCALE,I1HPRO,IBOS,NP,IG,IP,
     & ILEP,ID,IA,IB,ICOL4(4,4),ICOL5(5,18),ICOST(4,20),JJPROC,IVHVEC,
     & IVHLEP,MUP
      PARAMETER (IUNIT=61)
      LOGICAL BOPRO,NODEC,REMIT
      COMMON/NQQCOM/MQQ,NQQ
      COMMON/VHLIN/IVHVEC,IVHLEP
C---Colour flows for heavy quark pair production
      DATA ICOL4/
     & 10,02,10,02,01,20,20,01,12,23,10,03,12,31,30,02/
      DATA ICOL5/
     & 10,02,13,30,02, 10,02,32,10,03,
     & 10,21,30,20,03, 10,23,20,10,03,
     & 01,20,23,30,01, 01,20,31,20,03,
     & 01,23,03,20,01, 01,12,03,30,02,
     & 12,20,30,10,03, 12,30,10,30,02,
     & 12,03,02,10,03, 12,01,03,30,02,
     & 12,23,14,40,03, 12,34,32,10,04,
     & 12,23,43,10,04, 12,31,34,40,02,
     & 12,34,14,30,02, 12,31,42,30,04/
C---Colour flows for single top production
      DATA ICOST/
     & 20,12,00,10, 12,20,00,10, 10,02,02,10, 02,10,02,10,
     & 20,10,20,10, 20,02,01,10, 10,20,20,10, 02,20,01,10,
     & 20,02,01,10, 10,02,02,10, 02,20,01,10, 02,10,02,10,
     & 20,10,20,10, 10,20,20,10, 12,23,03,10, 23,12,03,10,
     & 30,12,32,10, 30,23,21,10, 12,30,32,10, 23,30,21,10/
      IF (IERROR.NE.0) RETURN
C---READ AN EVENT
      IF(NQQ.GE.MQQ)CALL HWWARN('UPEVNT',201)
      READ(IUNIT,901) I1HPRO,IC,NP
      READ(IUNIT,902) (IDUP(I),I=1,NP)
      READ(IUNIT,903) XWGTUP,XSCALE
C---Les Houches expects mean weight to be the cross section in pb
      XWGTUP= XWGTUP*MQQ
      READ(IUNIT,904) ((PUP(J,I),J=1,4),I=1,NP)
      NQQ=NQQ+1
C---Input format is now (px,py,pz,m)
      DO I=1,NP
         E=SQRT(HWVDOT(4,PUP(1,I),PUP(1,I)))
         PUP(5,I)=PUP(4,I)
         PUP(4,I)=E
      ENDDO
      CALL HWVSUM(4,PUP(1,1),PUP(1,2),PCM)
      CALL HWUMAS(PCM)
C---REMIT MEANS A REAL PARTON EMISSION OCCURRED
      REMIT=PUP(4,3).NE.ZERO
C---NODEC MEANS DECAYS NOT YET DONE
      NODEC=NP.EQ.5
      NUP=NP
C---CHECK PROCESS CODE
      JJPROC=MOD(ABS(IPROC),10000)
      JPR=JJPROC/100
      BOPRO=JPR.EQ.13.OR.JPR.EQ.14.OR.JPR.EQ.16.OR.JPR.EQ.36
      IF (BOPRO) THEN
C----------------------------------------------------------------------
C   SINGLE GAUGE OR HIGGS BOSON PRODUCTION
C   B = Z/gamma, W or H (SM or any MSSM neutral Higgs)
C-----------------------------------------------------------------------
C I1HPRO IDENTIFIES THE PARTONIC SUBPROCESS, WITH THE FOLLOWING CONVENTIONS:
C   I1HPRO         PROCESS
C    401        q qbar -> g B
C    402        q g    -> q B
C    403        qbar q -> g B
C    404        qbar g -> qbar B
C    405        g q    -> q B
C    406        g qbar -> qbar B
C    407        g g    -> g B
C-----------------------------------------------------------------------
C---NODEC=.TRUE. FOR HIGGS AND UNDECAYED EW BOSON
         NODEC=NP.EQ.4
         IHPRO=I1HPRO-400
         ISCALE=0
         IF(JPR.EQ.16)ISCALE=2
      ELSEIF (JPR.EQ.17.OR.JPR.EQ.20) THEN
C----------------------------------------------------------------------
C   HEAVY Q and/or QBAR PRODUCTION
C   IPROC=-1705,-1706 for Q=b,t
C   IPROC=-2000,-2030/1/4 for single top, Wt+Wtb/Wtb/Wt
C-----------------------------------------------------------------------
C I1HPRO IDENTIFIES THE PARTONIC SUBPROCESS, WITH THE FOLLOWING CONVENTIONS:
C   I1HPRO         PROCESS
C    401        q qbar -> g Q Qbar
C    402        q g    -> q Q Qbar
C    403        qbar q -> g Q Qbar
C    404        qbar g -> qbar Q Qbar
C    405        g q    -> q Q Qbar
C    406        g qbar -> qbar Q Qbar
C    407        g g    -> g Q Qbar
C    408        q q    -> g t q
C    409        qbar qbar -> g tbar qbar
C-----------------------------------------------------------------------
C IC SPECIFIES THE COLOUR CONNECTION (NOW IN INPUT FILE)
C-----------------------------------------------------------------------
C---SET IHPRO AS FOR DIRECT PHOTON (IPROC=1800)
         IHPRO=I1HPRO-360
         ISCALE=0
         IF(ABS(IPROC).EQ.1705.OR.ABS(IPROC).EQ.11705)ISCALE=5
      ELSEIF (JPR.EQ.28) THEN
C----------------------------------------------------------------------
C   GAUGE BOSON PAIR PRODUCTION
C   VV=WW,ZZ,ZW+,ZW- FOR IPROC=-2850,-2860,-2870,-2880
C-----------------------------------------------------------------------
C I1HPRO IDENTIFIES THE PARTONIC SUBPROCESS, WITH THE FOLLOWING CONVENTIONS:
C   I1HPRO         PROCESS
C    401        q qbar -> g V V
C    402        q g    -> q V V
C    403        qbar q -> g V V
C    404        qbar g -> qbar V V
C    405        g q    -> q V V
C    406        g qbar -> qbar V V
C-----------------------------------------------------------------------
         IHPRO=I1HPRO-400
         ISCALE=0
      ELSEIF (JPR.EQ.26.OR.JPR.EQ.27) THEN
C----------------------------------------------------------------------
C   GAUGE BOSON PLUS HIGGS PRODUCTION
C   VH=WH,ZH FOR IPROC=-2600-ID,-2700-ID
C   WHERE ID CONTROLS HIGGS DECAY AS IN STANDARD HERWIG
C-----------------------------------------------------------------------
         IHPRO=I1HPRO-400
         ISCALE=0
      ELSEIF (JPR.EQ.1) THEN
C----------------------------------------------------------------------
C   E+E- ANNIHILATION
C----------------------------------------------------------------------
         ISCALE=1
      ELSE
         CALL HWWARN('UPEVNT',202)
      ENDIF
C---HARD SCALE
      SCALUP=PCM(5)
      IF (XSCALE.GT.0D0.AND.XSCALE.LT.PCM(5)) SCALUP=XSCALE
      IF (REMIT) THEN
         IF (ISCALE.EQ.0) THEN
            PTR=SQRT(PUP(1,3)**2+PUP(2,3)**2)
            SCALUP=PCM(5)-2.*PTR
         ELSEIF(ISCALE.EQ.1)THEN
            SCALUP=PCM(5)
         ELSEIF (ISCALE.EQ.2) THEN
            SCALUP=SQRT(PUP(1,3)**2+PUP(2,3)**2)
         ELSEIF (ISCALE.EQ.3.OR.ISCALE.EQ.4.OR.ISCALE.EQ.5) THEN
            PTR=SQRT(PUP(1,3)**2+PUP(2,3)**2)
            IA=4
            IB=5
            XMP2=PUP(5,3)**2
            XMA2=PUP(5,IA)**2
            XMB2=PUP(5,IB)**2
            S2=XMA2+XMB2+2*HWULDO(PUP(1,IA),PUP(1,IB))
            SIGMA=XMA2+XMB2
            DELTA=XMA2-XMB2
            BETA=SQRT(1-2*SIGMA/S2+(DELTA/S2)**2)
            VA=BETA/(1+DELTA/S2)
            VB=BETA/(1-DELTA/S2)
            XKA=HWULDO(PUP(1,3),PUP(1,IA))
            XKB=HWULDO(PUP(1,3),PUP(1,IB))
            E=(XKA+XKB)/SQRT(S2)
            PL=-2.0/((VA+VB)*BETA*SQRT(S2))*(VA*XKA-VB*XKB)
            PTF=E**2-PL**2-XMP2
            IF (PTF.LE.ZERO) THEN
               CALL HWWARN('UPEVNT',103)
               GOTO 999
            ENDIF
            PTF=SQRT(PTF)
            IF(ISCALE.EQ.3)THEN
              SCALUP=PCM(5)-2.*MIN(PTR,PTF)
            ELSEIF(ISCALE.EQ.4)THEN
              SCALUP=MIN(PTR,PTF)
            ELSE
              SCALUP=(MIN(PTR,PTF))**2+(XMA2+XMB2)/2.D0
              SCALUP=SQRT(SCALUP)
            ENDIF
            IF (SCALUP.LE.ZERO) THEN
               CALL HWWARN('UPEVNT',100)
               GOTO 999
            ENDIF
         ELSEIF (ISCALE.EQ.6) THEN
            XMTR=SQRT(PUP(5,4)**2+PUP(1,4)**2+PUP(2,4)**2)
            PTR=SQRT(PUP(1,3)**2+PUP(2,3)**2)
            SCALUP=PCM(5)-PTR-XMTR
            IF (SCALUP.LE.ZERO) THEN
               CALL HWWARN('UPEVNT',100)
               GOTO 999
            ENDIF
         ELSEIF (ISCALE.EQ.7) THEN
            SCALUP=SQRT(PUP(5,4)**2+PUP(1,4)**2+PUP(2,4)**2)
         ELSE
            CALL HWWARN('UPEVNT',501)
         ENDIF
      ELSE
         NUP=NUP-1
      ENDIF
C---INITIAL STATE
      DO I=1,2
         ISTUP(I)=-1
         MOTHUP(1,I)=0
         MOTHUP(2,I)=0
      ENDDO
C---FINAL STATE
      DO I=3,NUP
         ISTUP(I)=1
         MOTHUP(1,I)=1
         MOTHUP(2,I)=2
      ENDDO
      IF (BOPRO.AND.NODEC) THEN
C---SINGLE BOSON (UNDECAYED)
         IF (REMIT) THEN
C---SET COLOUR CONNECTIONS
            DO I=1,3
               ICOLUP(1,I)=501
               ICOLUP(2,I)=502
            ENDDO
            IF (IHPRO.EQ.1) THEN
               ICOLUP(2,1)=0
               ICOLUP(1,2)=0
            ELSEIF (IHPRO.EQ.2) THEN
               ICOLUP(1,1)=502
               ICOLUP(2,1)=0
               ICOLUP(2,3)=0
            ELSEIF (IHPRO.EQ.3) THEN
               ICOLUP(1,1)=0
               ICOLUP(2,2)=0
            ELSEIF (IHPRO.EQ.4) THEN
               ICOLUP(1,1)=0
               ICOLUP(2,1)=501
               ICOLUP(1,3)=0
            ELSEIF (IHPRO.EQ.5) THEN
               ICOLUP(1,2)=502
               ICOLUP(2,2)=0
               ICOLUP(2,3)=0
            ELSEIF (IHPRO.EQ.6) THEN
               ICOLUP(1,2)=0
               ICOLUP(2,2)=501
               ICOLUP(1,3)=0
            ELSEIF (IHPRO.EQ.7) THEN
               ICOLUP(1,2)=502
               ICOLUP(2,2)=503
               ICOLUP(2,3)=503
            ELSE
               CALL HWWARN('UPEVNT',101)
               GOTO 999
            ENDIF
         ELSE
            CALL HWVEQU(5,PUP(1,4),PUP(1,3))
C---SET COLOUR CONNECTIONS
            DO I=1,2
               ICOLUP(1,I)=0
               ICOLUP(2,I)=0
            ENDDO
            IF (IDUP(1).GT.0) THEN
               ICOLUP(1,1)=501
               ICOLUP(2,2)=501
               IF (IDUP(1).GT.0) THEN
C---GG FUSION
                  ICOLUP(2,1)=502
                  ICOLUP(1,2)=502
               ENDIF
            ELSE
C---QBAR Q
               ICOLUP(2,1)=501
               ICOLUP(1,2)=501
            ENDIF
         ENDIF
         ICOLUP(1,NUP)=0
         ICOLUP(2,NUP)=0
C---LOAD BOSON ID
         IF (JPR.EQ.13) THEN
            IDUP(NUP)=23
         ELSEIF (JPR.EQ.16) THEN
            IDUP(NUP)=25
         ELSEIF (JPR.EQ.36) THEN
            IBOS=MOD(JJPROC,100)
            IF (IBOS.EQ.10) THEN
               IDUP(NUP)=26
            ELSEIF (IBOS.EQ.20) THEN
               IDUP(NUP)=35
            ELSEIF (IBOS.EQ.30) THEN
               IDUP(NUP)=36 
            ELSE
               CALL HWWARN('UPEVNT',502)
            ENDIF
         ELSEIF (JPR.EQ.14) THEN
            IBOS=0
            DO I=1,NUP-1
               ID=IDUP(I)
               IF (ID.EQ.21) THEN
                  IC=0
               ELSEIF (ID.GT.0) THEN
                  IC=ICHRG(ID)
               ELSE
                  IC=ICHRG(6-ID)
               ENDIF
               IBOS=IBOS+IC
            ENDDO
            IF (REMIT) IBOS=IBOS-2*IC
            IF (ABS(IBOS).NE.3) CALL  HWWARN('UPEVNT',503)
            IDUP(NUP)=8*IBOS
         ENDIF
      ELSEIF (JPR.EQ.17) THEN
C---HEAVY QUARKS
         IF (REMIT) THEN
C---3-BODY FINAL STATE
C---SET COLOUR CONNECTIONS
            IF (IC.LE.18) THEN
               DO I=1,5
                  CALL UPCODE(ICOL5(I,IC),ICOLUP(1,I))
               ENDDO
            ELSE
               CALL HWWARN('UPEVNT',105)
               GOTO 999
            ENDIF
         ELSE
C---2-BODY FINAL STATE
            DO IP=3,NUP
               IDUP(IP)=IDUP(IP+1)
               CALL HWVEQU(5,PUP(1,IP+1),PUP(1,IP))
            ENDDO
C---SET COLOUR CONNECTIONS
            IF (IC.LE.4) THEN
               DO I=1,4
                  CALL UPCODE(ICOL4(I,IC),ICOLUP(1,I))
               ENDDO
            ELSE
               CALL HWWARN('UPEVNT',104)
               GOTO 999
            ENDIF
         ENDIF
         IF (.NOT.NODEC) THEN
C---RECONSTRUCT TOP DECAYS
            IF (MOD(JJPROC,10).NE.6) THEN
               CALL HWWARN('UPEVNT',210)
               GOTO 999
            ENDIF
            NP=NUP
C--W DECAYS
            IDUP(NP+1)=IDUP(NP-5)
            IDUP(NP+2)=IDUP(NP-4)
            IDUP(NP+3)=IDUP(NP-2)
            IDUP(NP+4)=IDUP(NP-1)
            IDUP(NP-1)=IDUP(NP)
            CALL HWVEQU(5,PUP(1,NP-5),PUP(1,NP+1))
            CALL HWVEQU(5,PUP(1,NP-4),PUP(1,NP+2))
            CALL HWVEQU(5,PUP(1,NP-2),PUP(1,NP+3))
            CALL HWVEQU(5,PUP(1,NP-1),PUP(1,NP+4))
            CALL HWVEQU(5,PUP(1,NP  ),PUP(1,NP-1))
            CALL HWVSUM(4,PUP(1,NP+1),PUP(1,NP+2),PUP(1,NP-2))
            CALL HWVSUM(4,PUP(1,NP+3),PUP(1,NP+4),PUP(1,NP))
            CALL HWUMAS(PUP(1,NP-2))
            CALL HWUMAS(PUP(1,NP))
            IDUP(NP-2)=-24*(MOD(IDUP(NP+1),2)+MOD(IDUP(NP+2),2))
            IDUP(NP)=-IDUP(NP-2)
            DO IP=NP-3,NP+4
               ISTUP(IP)=1
            ENDDO
            ISTUP(NP-2)=2
            ISTUP(NP)=2
C--TOP DECAYS
            CALL HWVSUM(4,PUP(1,NP-3),PUP(1,NP-2),PUP(1,NP-5))
            CALL HWVSUM(4,PUP(1,NP-1),PUP(1,NP  ),PUP(1,NP-4))
            CALL HWUMAS(PUP(1,NP-5))
            CALL HWUMAS(PUP(1,NP-4))
            IDUP(NP-5)=IDUP(NP-2)/4
            IDUP(NP-4)=-IDUP(NP-5)
            ISTUP(NP-5)=2
            ISTUP(NP-4)=2
            MOTHUP(1,NP-5)=1
            MOTHUP(2,NP-5)=2
            MOTHUP(1,NP-4)=1
            MOTHUP(2,NP-4)=2
            MOTHUP(1,NP-3)=NP-5
            MOTHUP(1,NP-2)=NP-5
            MOTHUP(1,NP-1)=NP-4
            MOTHUP(1,NP  )=NP-4
            MOTHUP(1,NP+1)=NP-2
            MOTHUP(1,NP+2)=NP-2
            MOTHUP(1,NP+3)=NP
            MOTHUP(1,NP+4)=NP
            DO IP=NP-3,NP+4
               MOTHUP(2,IP)=MOTHUP(1,IP)
               ICOLUP(1,IP)=0
               ICOLUP(2,IP)=0
            ENDDO
            ICOLUP(1,NP-3)=ICOLUP(1,NP-5)
            ICOLUP(2,NP-3)=ICOLUP(2,NP-5)
            ICOLUP(1,NP-1)=ICOLUP(1,NP-4)
            ICOLUP(2,NP-1)=ICOLUP(2,NP-4)
            IF (IDUP(NP+1).GT.0) THEN
               ICOLUP(1,NP+1)=505
               ICOLUP(2,NP+2)=505
            ELSE
               ICOLUP(2,NP+1)=505
               ICOLUP(1,NP+2)=505
            ENDIF
            IF (IDUP(NP+3).GT.0) THEN
               ICOLUP(1,NP+3)=506
               ICOLUP(2,NP+4)=506
            ELSE
               ICOLUP(2,NP+3)=506
               ICOLUP(1,NP+4)=506
            ENDIF
            NUP=NP+4
         ENDIF
      ELSEIF (JPR.EQ.20) THEN
         IF (JJPROC.GE.2030) THEN
C---TOP+W FINAL STATE
C---SET COLOUR CONNECTIONS
            IF (IC.LE.20) THEN
               DO I=1,4
                  CALL UPCODE(ICOST(I,IC),ICOLUP(1,I))
               ENDDO
               ICOLUP(1,5)=0
               ICOLUP(2,5)=0
               IF (IDUP(4).LT.0) THEN
C---CHARGE CONJUGATE PROCESS
                  DO I=1,4
                     IA=ICOLUP(1,I)
                     ICOLUP(1,I)=ICOLUP(2,I)
                     ICOLUP(2,I)=IA
                  ENDDO
               ENDIF
            ELSE
               CALL HWWARN('UPEVNT',111)
               GOTO 999
            ENDIF
            IF (.NOT.REMIT) THEN
C---2-BODY FINAL STATE
               DO IP=3,NUP
                  IDUP(IP)=IDUP(IP+1)
                  ICOLUP(1,IP)=ICOLUP(1,IP+1)
                  ICOLUP(2,IP)=ICOLUP(2,IP+1)
                  CALL HWVEQU(5,PUP(1,IP+1),PUP(1,IP))
               ENDDO
            ENDIF
         ELSE
C---SINGLE TOP: IA,IB ARE THE QUARKS THAT ARE COLOUR CONNECTED
C   I.E. (FOR H EVENTS) THOSE THAT ARE NOT CONNECTED TO GLUON
            IA=IC/10
            IB=IC-10*IA
            IF (IA.LT.1.OR.IA.GT.5) THEN
               CALL HWWARN('UPEVNT',108)
            ELSEIF (IB.LT.1.OR.IB.GT.5) THEN
               CALL HWWARN('UPEVNT',109)
            ELSEIF (IA.EQ.IB) THEN
               CALL HWWARN('UPEVNT',110)
            ENDIF
            IF (IERROR.NE.0) GOTO 999
            IF (.NOT.NODEC) IDUP(5)=IDUP(5)+IDUP(6)
            DO I=1,5
               IF (I.EQ.IA.OR.I.EQ.IB) THEN
                  IF (IDUP(I).GT.0) THEN
                     ICOLUP(1,I)=501
                     ICOLUP(2,I)=0
                  ELSE
                     ICOLUP(1,I)=0
                     ICOLUP(2,I)=501
                  ENDIF
               ELSEIF (IDUP(I).EQ.21) THEN
                  IG=I
                  ICOLUP(1,I)=502
                  ICOLUP(2,I)=503
               ELSEIF (IDUP(I).GT.0) THEN
                  ICOLUP(1,I)=502
                  ICOLUP(2,I)=0
               ELSE
                  ICOLUP(1,I)=0
                  ICOLUP(2,I)=502
               ENDIF
            ENDDO
            IF (.NOT.NODEC) IDUP(5)=IDUP(5)-IDUP(6)
            IF (REMIT) THEN
C---3-BODY FINAL STATE
C---COMPLETE GLUON COLOUR CONNECTIONS
               IF (.NOT.NODEC) IDUP(5)=IDUP(5)+IDUP(6)
               DO I=1,5
                  IF (I.NE.IA.AND.I.NE.IB.AND.I.NE.IG) THEN
                     IF (IDUP(I).GT.0) THEN
                        IF((I.LT.3.AND.IG.LT.3)
     &                       .OR.(I.GT.2.AND.IG.GT.2)) ICOLUP(1,I)=503
                     ELSE
                        IF((I.LT.3.AND.IG.GT.2)
     &                       .OR.(I.GT.2.AND.IG.LT.3)) ICOLUP(2,I)=503
                     ENDIF
                  ENDIF
               ENDDO
               IF (.NOT.NODEC) IDUP(5)=IDUP(5)-IDUP(6)
            ELSE
C---2-BODY FINAL STATE
               DO IP=3,NUP
                  IDUP(IP)=IDUP(IP+1)
                  CALL HWVEQU(5,PUP(1,IP+1),PUP(1,IP))
               ENDDO
C---SET COLOUR CONNECTIONS
               ICOLUP(1,3)=ICOLUP(1,4)
               ICOLUP(2,3)=ICOLUP(2,4)
               ICOLUP(1,4)=ICOLUP(1,5)
               ICOLUP(2,4)=ICOLUP(2,5)
            ENDIF
         ENDIF
         IF (.NOT.NODEC) THEN
C---RECONSTRUCT TOP DECAY
            NP=NUP
            IDUP(NP+1)=IDUP(NP-2)
            IDUP(NP+2)=IDUP(NP-1)
            IDUP(NP-1)=24*(IDUP(NP+1)+IDUP(NP+2))
            IDUP(NP-2)=IDUP(NP-1)/4
            CALL HWVEQU(5,PUP(1,NP-2),PUP(1,NP+1))
            CALL HWVEQU(5,PUP(1,NP-1),PUP(1,NP+2))
            CALL HWVSUM(4,PUP(1,NP+1),PUP(1,NP+2),PUP(1,NP-1))
            CALL HWVSUM(4,PUP(1,NP-1),PUP(1,NP  ),PUP(1,NP-2))
            CALL HWUMAS(PUP(1,NP-1))
            CALL HWUMAS(PUP(1,NP-2))
            DO IP=NP-3,NP+2
               ISTUP(IP)=1
            ENDDO
            ISTUP(NUP-1)=2
            ISTUP(NUP-2)=2
            MOTHUP(1,NP-3)=1
            MOTHUP(2,NP-3)=2
            MOTHUP(1,NP-2)=1
            MOTHUP(2,NP-2)=2
            MOTHUP(1,NP-1)=NP-2
            MOTHUP(1,NP  )=NP-2
            MOTHUP(1,NP+1)=NP-1
            MOTHUP(1,NP+2)=NP-1
            DO IP=NP-1,NP+2
               MOTHUP(2,IP)=MOTHUP(1,IP)
               ICOLUP(1,IP)=0
               ICOLUP(2,IP)=0
            ENDDO
            ICOLUP(1,NP)=ICOLUP(1,NP-2)
            ICOLUP(2,NP)=ICOLUP(2,NP-2)
            NUP=NP+2
         ENDIF
       ELSEIF (JPR.EQ.1) THEN
C---E+E- ANNIHILATION
         DO I=1,NUP
            ICOLUP(1,I)=0
            ICOLUP(2,I)=0
         ENDDO
C---RESCALE 3-MOMENTA TO PUT PARTONS ON-SHELL
         PUP(5,1)=RMASS(121)
         PUP(5,2)=PUP(5,1)
         CALL HWURSC(2,PUP)
         PUP(5,3)=RMASS(13)
         PUP(5,4)=RMASS(ABS(IDUP(4)))
         PUP(5,5)=PUP(5,4)
         IF (REMIT) THEN
            CALL HWURSC(3,PUP(1,3))
            ICOLUP(1,3)=501
            ICOLUP(2,3)=502
            IF (IDUP(4).GT.0) THEN
               ICOLUP(1,4)=502
               ICOLUP(2,5)=501
            ELSE
               ICOLUP(2,4)=501
               ICOLUP(1,5)=502
            ENDIF
         ELSE
            CALL HWURSC(2,PUP(1,4))
            DO I=3,4
               CALL HWVEQU(5,PUP(1,I+1),PUP(1,I))
               IDUP(I)=IDUP(I+1)
               ISTUP(I)=1
            ENDDO
            IF (IDUP(3).GT.0) THEN
               ICOLUP(1,3)=501
               ICOLUP(2,4)=501
            ELSE
               ICOLUP(2,3)=501
               ICOLUP(1,4)=501
            ENDIF
         ENDIF
      ELSE
C---BOSON PAIR OR LEPTON PAIR
         IF (BOPRO.OR.NODEC) THEN
            NUP=6
            DO I=6,5,-1
               CALL HWVEQU(5,PUP(1,I-1),PUP(1,I))
               IDUP(I)=IDUP(I-1)
               ISTUP(I)=1
            ENDDO
         ELSE
C---BOSON PAIR: ONE OR BOTH DECAYED
C---ADD BOSON(S) TO EVENT RECORD
            IF (ABS(IDUP(6)).LT.20) THEN
               NUP=8
               I=2
               IF (ABS(IDUP(4)).LT.20) THEN
                  NUP=10
                  I=3
               ENDIF
               MUP=NUP-1
               CALL HWVEQU(5,PUP(1,MUP-I),PUP(1,MUP))
               CALL HWVEQU(5,PUP(1,NUP-I),PUP(1,NUP))
               CALL HWVSUM(4,PUP(1,MUP),PUP(1,NUP),PUP(1,6))
               CALL HWUMAS(PUP(1,6))
               IDUP(MUP)=IDUP(MUP-I)
               IDUP(NUP)=IDUP(NUP-I)
               ISTUP(MUP)=1
               ISTUP(NUP)=1
               MOTHUP(1,MUP)=6
               MOTHUP(2,MUP)=6
               MOTHUP(1,NUP)=6
               MOTHUP(2,NUP)=6
               ISTUP(6)=2
               ID=IDUP(MUP)+IDUP(NUP)
               IF (ID.EQ.0) THEN
                  IDUP(6)=23
               ELSEIF (ABS(ID).EQ.1) THEN
                  IDUP(6)=24*ID
               ELSE
                  CALL HWWARN('UPEVNT',106)
                  GOTO 999            
               ENDIF
            ENDIF
            IF (ABS(IDUP(4)).LT.20) THEN
               CALL HWVZRO(4,PDB)
               DO I=8,7,-1
                  CALL HWVEQU(5,PUP(1,I-3),PUP(1,I))
                  CALL HWVSUM(4,PUP(1,I),PDB,PDB)
                  IDUP(I)=IDUP(I-3)
                  ISTUP(I)=1
                  MOTHUP(1,I)=5
                  MOTHUP(2,I)=5
               ENDDO
               CALL HWUMAS(PDB)
               CALL HWVEQU(5,PDB,PUP(1,5))
               ISTUP(5)=2
               ID=IDUP(7)+IDUP(8)
               IF (ID.EQ.0) THEN
                  IDUP(5)=23
               ELSEIF (ABS(ID).EQ.1) THEN
                  IDUP(5)=24*ID
               ELSE
                  CALL HWWARN('UPEVNT',107)
                  GOTO 999
               ENDIF
            ELSE
               CALL HWVEQU(5,PUP(1,4),PUP(1,5))
               IDUP(5)=IDUP(4)
               ISTUP(5)=1
               MOTHUP(1,5)=4
               MOTHUP(2,5)=4
            ENDIF
         ENDIF
C---ADD DIBOSON OR DILEPTON TO EVENT RECORD (TO FIX ITS MASS)
         CALL HWVZRO(4,PDB)
         DO I=6,5,-1
            CALL HWVSUM(4,PUP(1,I),PDB,PDB)
            MOTHUP(1,I)=4
            MOTHUP(2,I)=4
         ENDDO
         CALL HWUMAS(PDB)
         CALL HWVEQU(5,PDB,PUP(1,4))
         ISTUP(4)=2
         IDUP(4)=0
         IF (REMIT) THEN
C---SET COLOUR CONNECTIONS
            DO I=1,3
               ICOLUP(1,I)=501
               ICOLUP(2,I)=502
            ENDDO
            IF (IHPRO.EQ.1) THEN
               ICOLUP(2,1)=0
               ICOLUP(1,2)=0
            ELSEIF (IHPRO.EQ.2) THEN
               ICOLUP(1,1)=502
               ICOLUP(2,1)=0
               ICOLUP(2,3)=0
            ELSEIF (IHPRO.EQ.3) THEN
               ICOLUP(1,1)=0
               ICOLUP(2,2)=0
            ELSEIF (IHPRO.EQ.4) THEN
               ICOLUP(1,1)=0
               ICOLUP(2,1)=501
               ICOLUP(1,3)=0
            ELSEIF (IHPRO.EQ.5) THEN
               ICOLUP(1,2)=502
               ICOLUP(2,2)=0
               ICOLUP(2,3)=0
            ELSEIF (IHPRO.EQ.6) THEN
               ICOLUP(1,2)=0
               ICOLUP(2,2)=501
               ICOLUP(1,3)=0
            ELSE
               CALL HWWARN('UPEVNT',102)
               GOTO 999
            ENDIF
            DO I=4,NUP
               ICOLUP(1,I)=0
               ICOLUP(2,I)=0
            ENDDO
         ELSE
            DO I=5,NUP
               CALL HWVEQU(5,PUP(1,I),PUP(1,I-2))
               IDUP(I-2)=IDUP(I)
               ISTUP(I-2)=ISTUP(I)
               MOTHUP(1,I-2)=MOTHUP(1,I)-2
               MOTHUP(2,I-2)=MOTHUP(1,I)-2
            ENDDO
            MOTHUP(1,3)=1
            MOTHUP(1,4)=1
            NUP=NUP-2
C---SET COLOUR CONNECTIONS
            DO I=1,NUP
               ICOLUP(1,I)=0
               ICOLUP(2,I)=0
            ENDDO
            IF (IDUP(1).GT.0) THEN
               ICOLUP(1,1)=501
               ICOLUP(2,2)=501
            ELSE
               ICOLUP(2,1)=501
               ICOLUP(1,2)=501
            ENDIF
         ENDIF
         IF (BOPRO) THEN
C---DILEPTON PRODUCTION
            IBOS=MOD(JJPROC,100)
            ILEP=MOD(JJPROC,10)
            IBOS=IBOS-ILEP
C---LOAD LEPTON AND BOSON ID
            I=NUP-1
            J=NUP
            IF ( IBOS.EQ.50 .OR.
     #          (IBOS.EQ.60.AND.JPR.EQ.13) .OR.
     #          (IBOS.EQ.70.AND.JPR.EQ.13) ) THEN
               IDUP(I)=-ILEP-10
               IDUP(J)=-IDUP(I)
               IF (REMIT) IDUP(4)=23
            ELSEIF (IBOS.EQ.60.AND.JPR.EQ.14) THEN
               IDUP(I)=-9-2*ILEP
               IDUP(J)=1-IDUP(I)
               IF (REMIT) IDUP(4)=24
            ELSEIF (IBOS.EQ.70.AND.JPR.EQ.14) THEN
               IDUP(I)=-10-2*ILEP
               IDUP(J)=-1-IDUP(I)
               IF (REMIT) IDUP(4)=-24
            ELSE
               CALL HWWARN('UPEVNT',504)
            ENDIF
         ENDIF
      ENDIF
 999  CONTINUE
      IF(IERROR.LT.100) RETURN 
      PRINT *
      DO I=1,NUP
         PRINT '(4I4,5F8.2)',IDUP(I),ISTUP(I),(ICOLUP(J,I),J=1,2),
     &        (PUP(J,I),J=1,5)
      ENDDO
c       IPR, IC, NP
 901  FORMAT(1X,I3,2(1X,I2))
c      (ID(I),I=1,NP)
 902  FORMAT(9(1X,I3))
c       XEVWGT,EMSCA
 903  FORMAT(2(1X,D14.8))
c      ((P(J,I),J=1,4),I=1,NP)
 904  FORMAT(36(1X,D14.8))
c 901  FORMAT(1X,I3,4(1X,I2))
c 902  FORMAT(1X,D14.8)
c 903  FORMAT(16(1X,D14.8))
      END
C----------------------------------------------------------------------
      SUBROUTINE UPCODE(ICODE,ICOL)
C--DECODES COLOUR CONNECTIONS
C----------------------------------------------------------------------
      IMPLICIT NONE
      INTEGER ICODE,ICOL(2)
      ICOL(1)=ICODE/10
      IF (ICOL(1).NE.0) ICOL(1)=ICOL(1)+500
      ICOL(2)=MOD(ICODE,10)
      IF (ICOL(2).NE.0) ICOL(2)=ICOL(2)+500
      END
C----------------------------------------------------------------------
      SUBROUTINE UPINIT
C----------------------------------------------------------------------
C  Reads MC@NLO input headers and fills Les Houches run common HEPRUP
C----------------------------------------------------------------------
      INCLUDE 'HERWIG65.INC'
C--Les Houches Common Blocks
      INTEGER MAXPUP
      PARAMETER(MAXPUP=100)
      INTEGER IDBMUP,PDFGUP,PDFSUP,IDWTUP,NPRUP,LPRUP
      DOUBLE PRECISION EBMUP,XSECUP,XERRUP,XMAXUP
      COMMON /HEPRUP/ IDBMUP(2),EBMUP(2),PDFGUP(2),PDFSUP(2),
     &                IDWTUP,NPRUP,XSECUP(MAXPUP),XERRUP(MAXPUP),
     &                XMAXUP(MAXPUP),LPRUP(MAXPUP)
      INTEGER MAXNUP
      PARAMETER (MAXNUP=500)
      INTEGER NUP,IDPRUP,IDUP,ISTUP,MOTHUP,ICOLUP
      DOUBLE PRECISION XWGTUP,SCALUP,AQEDUP,AQCDUP,PUP,VTIMUP,SPINUP
      COMMON/HEPEUP/NUP,IDPRUP,XWGTUP,SCALUP,AQEDUP,AQCDUP,
     &              IDUP(MAXNUP),ISTUP(MAXNUP),MOTHUP(2,MAXNUP),
     &              ICOLUP(2,MAXNUP),PUP(5,MAXNUP),VTIMUP(MAXNUP),
     &              SPINUP(MAXNUP)
      DOUBLE PRECISION XCKECM,XTMP1,XTMP2,XTMP3,XTMP4,XMT,XMW,XMZ,
     & XMH,XMV,XM1,XM2,XM3,XM4,XM5,XM21,XLAM,GAH,GAT,GAW,TINY
      DOUBLE PRECISION XMV1,GAV1,GAMAX1,XMV2,GAV2,GAMAX2
      INTEGER IVVCODE,IFAIL,MQQ,NQQ,IHW,I,NDNS,JPR,JPR0,IH,
     & IVHVEC,IVHLEP,IVLEP1,IVLEP2
      CHARACTER*60 TMPSTR
      CHARACTER*4 STRP1,STRP2
      CHARACTER*8 STRGRP
      CHARACTER*2 STRSCH
      CHARACTER*3 STRFMT
      CHARACTER*50 QQIN
      LOGICAL FK88STRNOEQ
      DATA TINY/1.D-3/
      COMMON/NQQCOM/MQQ,NQQ
      COMMON/VVJIN/QQIN
      COMMON/VHLIN/IVHVEC,IVHLEP
      COMMON/VVLIN/IVLEP1,IVLEP2
C
      IF (IERROR.NE.0) RETURN
C--SET UP INPUT FILES
      OPEN(UNIT=61,FILE=QQIN,STATUS='UNKNOWN')
C--READ HEADERS OF EVENT FILE
      READ(61,801)XCKECM,XTMP1,XTMP2,XTMP3,XTMP4,TMPSTR
      READ(61,802)IVVCODE,TMPSTR
      IVVCODE=MOD(IVVCODE,10000)
C---CHECK PROCESS CODE
      JPR0=MOD(ABS(IPROC),10000)
      JPR=JPR0/100
      IF (JPR.NE.IVVCODE/100) CALL HWWARN('UPINIT',500)
      IF ((JPR.EQ.17.OR.JPR.EQ.28.OR.JPR.EQ.36).AND.
     & IVVCODE.NE.MOD(ABS(IPROC),10000)) CALL HWWARN('UPINIT',501)
      IF (JPR.EQ.13.OR.JPR.EQ.14) THEN
         IF(JPR0.EQ.1396.OR.JPR0.EQ.1371.OR.
     #      JPR0.EQ.1372.OR.JPR0.EQ.1373)THEN
           READ(61,808)EMMIN,EMMAX,TMPSTR
         ELSE
           READ(61,809)XMV,GAH,GAMMAX,TMPSTR
         ENDIF
C-- CHECK VECTOR BOSON MASS
         IF( (IVVCODE.EQ.1397.AND.ABS(XMV-RMASS(200)).GT.TINY) .OR.
     #       (IVVCODE.EQ.1497.AND.ABS(XMV-RMASS(198)).GT.TINY) .OR.
     #       (IVVCODE.EQ.1498.AND.ABS(XMV-RMASS(199)).GT.TINY) )
     #      CALL HWWARN('UPINIT',502)
      ELSEIF (JPR.EQ.26.OR.JPR.EQ.27) THEN
         READ(61,810)IVHVEC,IVHLEP,TMPSTR
         READ(61,809)XMV,GAH,GAMMAX,TMPSTR
         READ(61,809)XMH,GAH,GAMMAX,TMPSTR
         IF( (JPR.EQ.26.AND.ABS(XMV-RMASS(199)).GT.TINY) .OR.
     #       (JPR.EQ.27.AND.ABS(XMV-RMASS(200)).GT.TINY) )
     #      CALL HWWARN('UPINIT',508)
         IF(ABS(XMH-RMASS(201)).GT.TINY) CALL HWWARN('UPINIT',509)
      ELSEIF (JPR.EQ.28) THEN
         READ(61,808)XMW,XMZ,TMPSTR
C-- CHECK VECTOR BOSON MASSES
         IF(ABS(XMW-RMASS(198)).GT.TINY .OR.
     #      ABS(XMZ-RMASS(200)).GT.TINY) CALL HWWARN('UPINIT',502)
         READ(61,810)IVLEP1,IVLEP2,TMPSTR
         READ(61,809)XMV1,GAV1,GAMAX1,TMPSTR
         READ(61,809)XMV2,GAV2,GAMAX2,TMPSTR
      ELSEIF (JPR.EQ.16.OR.JPR.EQ.36) THEN
         READ(61,809)XMH,GAH,XMT,TMPSTR
C-- CHECK HIGGS AND TOP MASSES
         IH=201
         IF (JPR.EQ.36) IH=IVVCODE/10-158
         IF(ABS(XMH-RMASS(IH)).GT.TINY) CALL HWWARN('UPINIT',503)
         IF(ABS(XMT-RMASS(6)) .GT.TINY) CALL HWWARN('UPINIT',504)
      ELSEIF (JPR.EQ.17) THEN
         IF (MOD(JPR0,10).EQ.6) THEN
            READ(61,808)XMT,GAT,TMPSTR
         ELSE
            READ(61,803)XMT,TMPSTR
         ENDIF
C-- CHECK HEAVY QUARK MASS
         IF( (IVVCODE.EQ.1706.AND.ABS(XMT-RMASS(6)).GT.TINY) .OR.
     #       (IVVCODE.EQ.1705.AND.ABS(XMT-RMASS(5)).GT.TINY) .OR.
     #       (IVVCODE.EQ.1704.AND.ABS(XMT-RMASS(4)).GT.TINY) )
     #   CALL HWWARN('UPINIT',505)
         IF (MOD(JPR0,10).EQ.6) THEN
            READ(61,808)XMW,GAW,TMPSTR
            READ(61,810)IVLEP1,IVLEP2,TMPSTR
C-- CHECK W BOSON MASS WHEN TOPS DECAY
            IF( IVLEP1.NE.7.AND.IVLEP2.NE.7 .AND.
     #          ABS(XMW-RMASS(198)).GT.TINY ) 
     #         CALL HWWARN('UPINIT',502)
         ENDIF
      ELSEIF (JPR.EQ.20) THEN
         READ(61,808)XMT,GAT,TMPSTR
C-- CHECK TOP QUARK MASS
         IF(ABS(XMT-RMASS(6)).GT.TINY) CALL HWWARN('UPINIT',511)
         READ(61,808)XMW,GAW,TMPSTR
         READ(61,812)IVLEP1,TMPSTR
C-- CHECK W BOSON MASS WHEN TOPS DECAY
         IF( IVLEP1.NE.7 .AND.
     #       ABS(XMW-RMASS(198)).GT.TINY ) CALL HWWARN('UPINIT',502)
      ELSEIF (JPR.NE.1) THEN
         CALL HWWARN('UPINIT',506)
      ENDIF
      READ(61,804)XM1,XM2,XM3,XM4,XM5,XM21,TMPSTR
      IF (JPR.NE.1) THEN
         READ(61,805)STRP1,STRP2,TMPSTR
         READ(61,806)STRGRP,NDNS,TMPSTR
      ENDIF
      READ(61,807)XLAM,STRSCH,TMPSTR
C--CHECK THAT EVENT FILE HAS BEEN GENERATED CONSISTENTLY WITH 
C--HERWIG PARAMETERS ADOPTED HERE
      IFAIL=0
C-- CM ENERGY
      IF( ABS(XCKECM-PBEAM1-PBEAM2).GT.TINY .OR.
C-- QUARK AND GLUON MASSES
     #     ABS(XM1-RMASS(1)).GT.TINY .OR.
     #     ABS(XM2-RMASS(2)).GT.TINY .OR.
     #     ABS(XM3-RMASS(3)).GT.TINY .OR.
     #     ABS(XM4-RMASS(4)).GT.TINY .OR.
     #     ABS(XM5-RMASS(5)).GT.TINY .OR.
     #     ABS(XM21-RMASS(13)).GT.TINY) IFAIL=1
C-- LAMBDA_QCD: NOW REMOVED TO ALLOW MORE FLEXIBILITY (NNLO EFFECT ANYHOW)
C     #     ABS(XLAM-QCDLAM).GT.TINY .OR.
C-- REPLACE THE FOLLOWING WITH A CONDITION ON STRSCH, IF CONSISTENT 
C-- INFORMATION ON PDF SCHEME WILL BE AVAILABLE FROM PDF LIBRARIES AND HERWIG
C-- COLLIDING PARTICLE TYPE
      IF (JPR.NE.1.AND.IFAIL.EQ.0) THEN
         IF(
     #        FK88STRNOEQ(STRP1,PART1) .OR.
     #        FK88STRNOEQ(STRP2,PART2) )IFAIL=1
C--IF PDF LIBRARY IS USED, CHECK PDF CONSISTENCY
         IF( IFAIL.EQ.0 .AND. MODPDF(1).NE.-1)THEN
            IF( 
     #          FK88STRNOEQ(STRGRP,AUTPDF(1)) .OR.
     #          FK88STRNOEQ(STRGRP,AUTPDF(2)) .OR.
     #          ABS(NDNS-MODPDF(1)).GT.TINY .OR.
     #          ABS(NDNS-MODPDF(2)).GT.TINY )IFAIL=1
C--WHEN LHAPDF IS LINKED, AUTPDF() IS A MC@NLO-DEFINED STRING
            IF(AUTPDF(1).EQ.'LHAPDF'.OR.AUTPDF(1).EQ.'LHAEXT')THEN
               AUTPDF(1)='DEFAULT'
               AUTPDF(2)='DEFAULT'
            ENDIF
         ENDIF
      ENDIF
      IF(IFAIL.EQ.1) CALL HWWARN('UPINIT',507)
      CALL HWUIDT(3,IDBMUP(1),IHW,PART1)
      CALL HWUIDT(3,IDBMUP(2),IHW,PART2)
      DO I=1,2
         EBMUP(I)=HALF*XCKECM
         PDFGUP(I)=-1
         PDFSUP(I)=-1
      ENDDO
      IDWTUP=-4
      NPRUP=1
      LPRUP(1)=IVVCODE
C-- TEST FOR NEW FORMAT INPUT MOMENTA: (PX,PY,PZ,M)
      READ(61,811) STRFMT,TMPSTR
      IF (STRFMT.NE.'P,M') CALL HWWARN('UPINIT',510)
      READ(61,900) MQQ
      NQQ=0
C-- LARGEST EXPECTED NUMBER OF LEGS
      NUP=10
      AQEDUP=ZERO
      AQCDUP=ZERO
      DO I=1,NUP
         VTIMUP(I)=ZERO
         SPINUP(I)=9.
      ENDDO
 801  FORMAT(5(1X,D10.4),1X,A)
 802  FORMAT(1X,I6,1X,A)
 803  FORMAT(1X,D10.4,1X,A)
 804  FORMAT(6(1X,D10.4),1X,A)
 805  FORMAT(2(1X,A4),1X,A)
 806  FORMAT(1X,A8,1X,I6,1X,A)
 807  FORMAT(1X,D10.4,1X,A2,1X,A)
 808  FORMAT(2(1X,D10.4),1X,A)
 809  FORMAT(3(1X,D10.4),1X,A)
 810  FORMAT(2(1X,I2),1X,A)
 811  FORMAT(1X,A3,1X,A)
 812  FORMAT(1X,I2,1X,A)
 900  FORMAT(I9)
 999  END


C----------------------------------------------------------------------
      SUBROUTINE HWURSC(NP,PP)
C  RESCALES A SET OF NP (<21) 3-MOMENTA PP(1-3,*) IN
C  THEIR CMF TO PUT PP ON MASS-SHELL AT MASSES PP(5,*) 
C----------------------------------------------------------------------
      IMPLICIT NONE
      INTEGER NP,IP,IT,NT
      DOUBLE PRECISION PP(5,*),P(5,20),P2(20),M2(20),SP(5),
     & TINY,FAC,ECM,DCM,EP,STEP,FRT,HWUSQR
      DATA TINY,NT/1D-9,20/
      IF (NP.GT.20) CALL HWWARN('HWURSC',300+NP)
C--COMPUTE CM MOMENTUM
      CALL HWVZRO(4,SP)
      DO IP=1,NP
         CALL HWVSUM(4,PP(1,IP),SP,SP)
      ENDDO
      CALL HWUMAS(SP)
C--BOOST TO CMF
      DO IP=1,NP
         CALL HWULOF(SP,PP(1,IP),P(1,IP))
         P2(IP)=P(1,IP)**2+P(2,IP)**2+P(3,IP)**2
         M2(IP)=P(5,IP)**2
      ENDDO
C--ITERATE RESCALING OF 3-MOMENTA
      FAC=1D0
      DO IT=1,NT
         ECM=0D0
         DCM=0D0
         DO IP=1,NP
            EP=HWUSQR(M2(IP)+FAC*P2(IP))
            IF (EP.GT.0D0) THEN
               ECM=ECM+EP
               DCM=DCM+P2(IP)/EP
            ENDIF
         ENDDO
         IF (DCM.EQ.0D0) CALL HWWARN('HWURSC',390)
         STEP=2D0*(ECM-SP(5))/DCM
         FAC=FAC-STEP
         IF (ABS(STEP).LT.TINY) GOTO 100
      ENDDO
C--FAILED TO CONVERGE
      CALL HWWARN('HWURSC',1)
C--CONVERGED: RESCALE 3-MOMENTA AND BOOST BACK 
 100  IF (FAC.LT.0D0) CALL HWWARN('HWURSC',391)
      FRT=SQRT(FAC)
      DO IP=1,NP
         CALL HWVSCA(3,FRT,P(1,IP),P(1,IP))
         P(4,IP)=SQRT(M2(IP)+FAC*P2(IP))
         CALL HWULOB(SP,P(1,IP),PP(1,IP))
      ENDDO
      END
