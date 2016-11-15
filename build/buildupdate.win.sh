#!/bin/bash
# server=build.palaso.org
# build_type=ChorusWin32LfmergeStrongnameCont
# root_dir=..
# Auto-generated by https://github.com/chrisvire/BuildUpdate.
# Do not edit this file by hand!

cd "$(dirname "$0")"

# *** Functions ***
force=0
clean=0

while getopts fc opt; do
case $opt in
f) force=1 ;;
c) clean=1 ;;
esac
done

shift $((OPTIND - 1))

copy_auto() {
if [ "$clean" == "1" ]
then
echo cleaning $2
rm -f ""$2""
else
where_curl=$(type -P curl)
where_wget=$(type -P wget)
if [ "$where_curl" != "" ]
then
copy_curl $1 $2
elif [ "$where_wget" != "" ]
then
copy_wget $1 $2
else
echo "Missing curl or wget"
exit 1
fi
fi
}

copy_curl() {
echo "curl: $2 <= $1"
if [ -e "$2" ] && [ "$force" != "1" ]
then
curl -# -L -z $2 -o $2 $1
else
curl -# -L -o $2 $1
fi
}

copy_wget() {
echo "wget: $2 <= $1"
f1=$(basename $1)
f2=$(basename $2)
cd $(dirname $2)
wget -q -L -N $1
# wget has no true equivalent of curl's -o option.
# Different versions of wget handle (or not) % escaping differently.
# A URL query is the only reason why $f1 and $f2 should differ.
if [ "$f1" != "$f2" ]; then mv $f2\?* $f2; fi
cd -
}


# *** Results ***
# build: chorus-win32-lfmerge Continuous (ChorusWin32LfmergeStrongnameCont)
# project: Chorus
# URL: http://build.palaso.org/viewType.html?buildTypeId=ChorusWin32LfmergeCont
# VCS: https://github.com/sillsdev/chorus.git [lfmerge]
# dependencies:
# [0] build: Chorus-Documentation (bt216)
#     project: Chorus
#     URL: http://build.palaso.org/viewType.html?buildTypeId=bt216
#     clean: false
#     revision: latest.lastSuccessful
#     paths: {"*.chm"=>"lib"}
#     VCS: https://github.com/sillsdev/chorushelp.git [master]
# [1] build: Helpprovider (bt225)
#     project: Helpprovider
#     URL: http://build.palaso.org/viewType.html?buildTypeId=bt225
#     clean: false
#     revision: latest.lastSuccessful
#     paths: {"Vulcan.Uczniowie.HelpProvider.dll"=>"lib/common"}
#     VCS: http://hg.palaso.org/helpprovider []
# [2] build: icucil-win32-default Continuous (bt14)
#     project: Libraries
#     URL: http://build.palaso.org/viewType.html?buildTypeId=bt14
#     clean: false
#     revision: latest.lastSuccessful
#     paths: {"icu*.dll"=>"lib/Release"}
#     VCS: https://github.com/sillsdev/icu-dotnet [master]
# [3] build: icucil-win32-default Continuous (bt14)
#     project: Libraries
#     URL: http://build.palaso.org/viewType.html?buildTypeId=bt14
#     clean: false
#     revision: latest.lastSuccessful
#     paths: {"icu*.dll"=>"lib/Debug"}
#     VCS: https://github.com/sillsdev/icu-dotnet [master]
# [4] build: palaso-win32-lfmerge Continuous (PalasoWin32lfmergeContinuous)
#     project: libpalaso
#     URL: http://build.palaso.org/viewType.html?buildTypeId=PalasoWin32lfmergeContinuous
#     clean: false
#     revision: latest.lastSuccessful
#     paths: {"Palaso.dll"=>"lib/Release", "Palaso.Lift.dll"=>"lib/Release", "Palaso.TestUtilities.dll"=>"lib/Release", "PalasoUIWindowsForms.dll"=>"lib/Release", "PalasoUIWindowsForms.GeckoBrowserAdapter.dll"=>"lib/Release", "L10NSharp.dll"=>"lib/Release", "debug/Palaso.dll"=>"lib/Debug", "debug/Palaso.pdb"=>"lib/Debug", "debug/Palaso.TestUtilities.dll"=>"lib/Debug", "debug/Palaso.TestUtilities.pdb"=>"lib/Debug", "debug/PalasoUIWindowsForms.dll"=>"lib/Debug", "debug/PalasoUIWindowsForms.pdb"=>"lib/Debug", "debug/PalasoUIWindowsForms.GeckoBrowserAdapter.dll"=>"lib/Debug", "debug/PalasoUIWindowsForms.GeckoBrowserAdapter.pdb"=>"lib/Debug", "debug/Palaso.Lift.dll"=>"lib/Debug", "debug/Palaso.Lift.pdb"=>"lib/Debug", "debug/L10NSharp.dll"=>"lib/Debug"}
#     VCS: https://github.com/sillsdev/libpalaso.git []

# make sure output directories exist
mkdir -p ../lib
mkdir -p ../lib/Debug
mkdir -p ../lib/Release
mkdir -p ../lib/common

# download artifact dependencies
copy_auto http://build.palaso.org/guestAuth/repository/download/bt216/latest.lastSuccessful/Chorus_Help.chm ../lib/Chorus_Help.chm
copy_auto http://build.palaso.org/guestAuth/repository/download/bt225/latest.lastSuccessful/Vulcan.Uczniowie.HelpProvider.dll ../lib/common/Vulcan.Uczniowie.HelpProvider.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt14/latest.lastSuccessful/icu.net.dll ../lib/Release/icu.net.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt14/latest.lastSuccessful/icudt54.dll ../lib/Release/icudt54.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt14/latest.lastSuccessful/icuin54.dll ../lib/Release/icuin54.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt14/latest.lastSuccessful/icuuc54.dll ../lib/Release/icuuc54.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt14/latest.lastSuccessful/icu.net.dll ../lib/Debug/icu.net.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt14/latest.lastSuccessful/icudt54.dll ../lib/Debug/icudt54.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt14/latest.lastSuccessful/icuin54.dll ../lib/Debug/icuin54.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/bt14/latest.lastSuccessful/icuuc54.dll ../lib/Debug/icuuc54.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/PalasoWin32lfmergeContinuous/latest.lastSuccessful/Palaso.dll ../lib/Release/Palaso.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/PalasoWin32lfmergeContinuous/latest.lastSuccessful/Palaso.Lift.dll ../lib/Release/Palaso.Lift.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/PalasoWin32lfmergeContinuous/latest.lastSuccessful/Palaso.TestUtilities.dll ../lib/Release/Palaso.TestUtilities.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/PalasoWin32lfmergeContinuous/latest.lastSuccessful/PalasoUIWindowsForms.dll ../lib/Release/PalasoUIWindowsForms.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/PalasoWin32lfmergeContinuous/latest.lastSuccessful/PalasoUIWindowsForms.GeckoBrowserAdapter.dll ../lib/Release/PalasoUIWindowsForms.GeckoBrowserAdapter.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/PalasoWin32lfmergeContinuous/latest.lastSuccessful/L10NSharp.dll ../lib/Release/L10NSharp.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/PalasoWin32lfmergeContinuous/latest.lastSuccessful/debug/Palaso.dll ../lib/Debug/Palaso.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/PalasoWin32lfmergeContinuous/latest.lastSuccessful/debug/Palaso.pdb ../lib/Debug/Palaso.pdb
copy_auto http://build.palaso.org/guestAuth/repository/download/PalasoWin32lfmergeContinuous/latest.lastSuccessful/debug/Palaso.TestUtilities.dll ../lib/Debug/Palaso.TestUtilities.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/PalasoWin32lfmergeContinuous/latest.lastSuccessful/debug/Palaso.TestUtilities.pdb ../lib/Debug/Palaso.TestUtilities.pdb
copy_auto http://build.palaso.org/guestAuth/repository/download/PalasoWin32lfmergeContinuous/latest.lastSuccessful/debug/PalasoUIWindowsForms.dll ../lib/Debug/PalasoUIWindowsForms.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/PalasoWin32lfmergeContinuous/latest.lastSuccessful/debug/PalasoUIWindowsForms.pdb ../lib/Debug/PalasoUIWindowsForms.pdb
copy_auto http://build.palaso.org/guestAuth/repository/download/PalasoWin32lfmergeContinuous/latest.lastSuccessful/debug/PalasoUIWindowsForms.GeckoBrowserAdapter.dll ../lib/Debug/PalasoUIWindowsForms.GeckoBrowserAdapter.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/PalasoWin32lfmergeContinuous/latest.lastSuccessful/debug/PalasoUIWindowsForms.GeckoBrowserAdapter.pdb ../lib/Debug/PalasoUIWindowsForms.GeckoBrowserAdapter.pdb
copy_auto http://build.palaso.org/guestAuth/repository/download/PalasoWin32lfmergeContinuous/latest.lastSuccessful/debug/Palaso.Lift.dll ../lib/Debug/Palaso.Lift.dll
copy_auto http://build.palaso.org/guestAuth/repository/download/PalasoWin32lfmergeContinuous/latest.lastSuccessful/debug/Palaso.Lift.pdb ../lib/Debug/Palaso.Lift.pdb
copy_auto http://build.palaso.org/guestAuth/repository/download/PalasoWin32lfmergeContinuous/latest.lastSuccessful/debug/L10NSharp.dll ../lib/Debug/L10NSharp.dll
# End of script
