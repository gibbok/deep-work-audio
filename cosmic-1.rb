# Cosmic 1
use_bpm 30

live_loop :cosmic_randomized do
  # Very long decay to avoid "clipping"
  with_fx :reverb, room: 1, mix: 0.6, damp: 0.2 do
    with_fx :echo, phase: [1.5, 0.75, 2.0].choose, decay: 8, mix: 0.3 do
      
      # 1. The Deep Star Field (Drone)
      # Randomizing the cutoff makes the "vibration" feel like it's moving
      use_synth :subpulse
      play :E2, attack: 4, release: 12, cutoff: rrand(40, 70), amp: 0.3
      
      # 2. The Solar Flare (528 Hz Base)
      # Occasionally shifting the pitch slightly for a "drifting" effect
      use_synth :hollow
      play 63.5 + rrand(-0.1, 0.1), attack: 5, release: 10, amp: 1.5
      
      # 3. The Pulsing Nebula (Generative Arpeggio)
      use_synth :prophet
      # Instead of a fixed ring, we pick random notes from the E minor scale
      8.times do
        # Only play a note 70% of the time to create "gaps" in the nebula
        if one_in(1.4)
          play (scale :e3, :minor_pentatonic, num_octaves: 3).choose,
            attack: rrand(2, 4),
            release: rrand(4, 6),
            amp: rrand(0.05, 0.2),
            cutoff: rrand(60, 95)
        end
        # Randomize the sleep to make the rhythm "inhale and exhale"
        sleep [1, 2, 3].choose
      end
      
      # 4. The Distant Star (High Shimmer)
      # Now it only appears occasionally, like a star passing by
      if one_in(2)
        use_synth :dpulse
        play [:E6, :A6, :B6].choose, attack: 5, release: 15, detune: rrand(0, 0.5), amp: 0.1
      end
      
      # The "void" duration is now unpredictable
      sleep rrand(8, 16)
    end
  end
end
