#!/bin/zsh
# Makes the skill's 8 sound effects from scratch with ffmpeg (pure maths, no samples), so they are
# licence-free and can be shared with the skill. Same file names the templates and the example use.
#
#   scripts/make_sfx.sh [OUT_DIR]      default OUT_DIR = the skill's assets/sfx
#
# Want nicer sounds? Drop your own CC0 files in with the same names (freesound.org CC0, Pixabay).
set -e
SKILL="${0:A:h:h}"
OUT="${1:-$SKILL/assets/sfx}"
mkdir -p "$OUT"
mk() { # name duration filtergraph-on-[a]
  ffmpeg -v error -y -f lavfi -i "$2" -af "$3,aformat=sample_rates=44100:channel_layouts=stereo" -c:a libmp3lame -b:a 192k "$OUT/$1.mp3"
  echo "  $1.mp3"
}
echo "Making SFX in $OUT"
# lengths match the original files the templates were timed with
# airy whoosh: pink noise, band-limited, swells in and out (2.48 s)
mk whoosh_soft   "anoisesrc=d=2.48:c=pink:a=0.7"  "highpass=f=250,lowpass=f=2600,afade=t=in:d=0.9,afade=t=out:st=1.0:d=1.48,volume=1.6"
# short light swoosh: brighter, quicker (1.48 s)
mk swoosh_light  "anoisesrc=d=1.48:c=white:a=0.5" "highpass=f=1400,lowpass=f=7000,afade=t=in:d=0.3,afade=t=out:st=0.35:d=1.1,volume=1.2"
# whoosh into a rise: noise + upward sine glide (3.59 s)
mk whoosh_riser  "aevalsrc=0.35*sin(2*PI*(180*t+70*t*t))+0.35*(random(0)*2-1):d=3.59" "lowpass=f=3500,afade=t=in:d=3.0,afade=t=out:st=3.25:d=0.34"
# clean riser: smooth sine sweep with a light tremolo (4.41 s)
mk riser_clean   "aevalsrc=0.5*sin(2*PI*(220*t+60*t*t))*(0.75+0.25*sin(2*PI*9*t)):d=4.41" "afade=t=in:d=3.9,afade=t=out:st=4.0:d=0.41"
# low boom: falling sub sine, long decay (3.55 s)
mk boom_low      "aevalsrc=0.95*sin(2*PI*(62*t-3*t*t))*exp(-1.6*t):d=3.55" "lowpass=f=400"
# impact: sub thump + noise crack, long tail (4.3 s)
mk boom_impact   "aevalsrc=0.8*sin(2*PI*55*t)*exp(-1.4*t)+0.55*(random(0)*2-1)*exp(-14*t):d=4.3" "lowpass=f=1800"
# metal click: two short high partials + a faint ring (1.81 s)
mk metal_click   "aevalsrc=0.6*sin(2*PI*3200*t)*exp(-45*t)+0.4*sin(2*PI*5150*t)*exp(-70*t)+0.08*sin(2*PI*2400*t)*exp(-3*t):d=1.81" "highpass=f=900"
# bell ding: fundamental + harmonics, slow decay (1.56 s)
mk ding_bell     "aevalsrc=0.42*sin(2*PI*1320*t)*exp(-3*t)+0.2*sin(2*PI*2640*t)*exp(-4.5*t)+0.1*sin(2*PI*3965*t)*exp(-6*t):d=1.56" "volume=1.0"
echo "Done. All 8 are made in code: free to use and share."
