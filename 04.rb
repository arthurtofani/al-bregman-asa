# DEMONSTRATION 04
# Cumulative effects of repetition on streaming


use_bpm 60
use_synth :beep
t1 = 0.12
factor = 1.0
high_note = hz_to_midi(2000)
low_note = hz_to_midi(700)

define :two_gallops do
  play high_note, attack: 0.0125, sustain: 0.088, release: 0.0125
  sleep t1
  play low_note, attack: 0.0125, sustain: 0.088, release: 0.0125, amp: 2
  sleep t1
  play high_note, attack: 0.0125, sustain: 0.088, release: 0.0125
  sleep t1
end

loop do
  2.times do
    two_gallops
    sleep t1
    # sleep t1 + (rand * t1)
    # sleep (t1 * factor); factor+=0.1
  end
end
