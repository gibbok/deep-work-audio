# Simple ocean
live_loop :simple_ocean do
  # 1. Randomize the Volume (amp) so some waves are stronger than others
  # 2. Randomize the Tone (cutoff) to vary between "deep" and "splashy" waves
  # 3. Randomize the Slide to change how fast the sound opens up
  
  active_cutoff = rrand(60, 95)
  
  s = synth :noise,
    amp: rrand(0.2, 0.6),
    attack: 4,
    release: 6,
    cutoff: active_cutoff,
    cutoff_slide: rrand(2, 5)
  
  # Control the synth mid-flight to create a "rolling" sound
  control s, cutoff: active_cutoff + 15
  
  # 4. Randomize the Sleep so the waves don't hit at the exact same interval
  sleep [7, 8, 9].choose
end
