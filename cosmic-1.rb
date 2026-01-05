# Cosmic 1
use_bpm 30

live_loop :cosmic_1 do
  # Massive room size to simulate the "void"
  with_fx :reverb, room: 1, mix: 0.6, damp: 0.2 do
    with_fx :echo, phase: 1.5, decay: 6, mix: 0.4 do
      
      # 1. The Deep Star Field (Drone)
      # A low, vibrating sub-frequency to ground the "cosmos"
      use_synth :subpulse
      play :E2, attack: 4, release: 8, cutoff: 60, amp: 0.4
      
      # 2. The Solar Flare (528 Hz Base)
      use_synth :hollow
      play 63.5, attack: 5, release: 10, amp: 1.5
      
      # 3. The Pulsing Nebula (The stretched arpeggio)
      use_synth :prophet
      notes = (ring :E4, :A4, :B4, :E5).reflect
      
      notes.each do |n|
        play n, attack: 3, release: 5, amp: 0.2, cutoff: rrand(60, 90)
        sleep 2 # Very slow movement through the stars
      end
      
      # 4. The Distant Star (High Shimmer)
      # Replacing the high ping with a cold but soft crystal sound
      use_synth :dpulse
      play :E6, attack: 2, release: 12, detune: 0.2, cutoff: 70, amp: 0.1
      
      # Wait for the sound to drift away into the void
      sleep 12
    end
  end
end
