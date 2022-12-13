@echo off
setlocal EnableDelayedExpansion

:: verbs
set verbs[0]=add
set verbs[1]=fix
set verbs[2]=update
set verbs[3]=refactor
set verbs[4]=remove
set verbs[5]=optimize
set verbs[6]=create
set verbs[7]=implement
set verbs[8]=cleanup
set verbs[9]=improve

:: words
set words[0]=river
set words[1]=ember
set words[2]=vortex
set words[3]=pulse
set words[4]=matrix
set words[5]=signal
set words[6]=glitch
set words[7]=flux
set words[8]=nova
set words[9]=orbit
set words[10]=emberly
set words[11]=lunar
set words[12]=spark
set words[13]=prism
set words[14]=nebula
set words[15]=aurora
set words[16]=echo
set words[17]=zenith
set words[18]=ripple
set words[19]=chronos
set words[20]=axis
set words[21]=cascade
set words[22]=drift
set words[23]=glow
set words[24]=horizon
set words[25]=ignite
set words[26]=jet
set words[27]=kismet
set words[28]=lumen
set words[29]=mosaic
set words[30]=opal
set words[31]=quasar
set words[32]=radiant
set words[33]=solace
set words[34]=tide
set words[35]=unison
set words[36]=blaze
set words[37]=comet
set words[38]=shard
set words[39]=aurorae

set year=2022

for /L %%i in (1,1,290) do (

    set /a r=!random! %% 40
    set /a v=!random! %% 10
    call set word=%%words[!r!]%%
    call set verb=%%verbs[!v!]%%

    if %%i==290 (
        set msg=final commit
    ) else (
        set msg=!verb! !word!
    )

    :: Date range: 2022-10-08 to 2022-12-27 (81 days total)
    set /a offset=!random! %% 81

    if !offset! LSS 24 (
        set month=10
        set /a day=8 + offset
    ) else if !offset! LSS 55 (
        set month=11
        set /a day=offset - 23
    ) else (
        set month=12
        set /a day=offset - 54
    )

    set /a hour=!random! %% 24
    set /a minute=!random! %% 60

    if !hour! LSS 10 set hour=0!hour!
    if !minute! LSS 10 set minute=0!minute!
    if !day! LSS 10 set day=0!day!
    if !month! LSS 10 set month=0!month!

    set commitdate=!year!-!month!-!day!T!hour!:!minute!:00

    echo commit %%i >> commits.txt

    git add .

    set GIT_AUTHOR_DATE=!commitdate!
    set GIT_COMMITTER_DATE=!commitdate!

    git commit -m "!msg!" --date "!commitdate!"

    echo %%i / 290 - !msg! - !commitdate!
)