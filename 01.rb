# DEMONSTRATION 01
# Stream segregation in a cycle of six tones

use_bpm 60
use_synth :beep

def play_note(freq, sustain)
  play hz_to_midi(freq), attack: @attack, sustain: sustain, release: @release, amp: (@low_tones.include?(freq) ? 2 : 1)
end

def ms(duration_in_miliseconds)
  duration_in_miliseconds/1000.0
end

def play_sequence(sustain)
  4.times do
    @high_tones.each_with_index do |tone, i|
      play_note @high_tones[i], sustain
      sleep sustain
      play_note @low_tones[i], sustain
      sleep sustain
    end
  end
end

#### Global data
@high_tones = [2500, 2000, 1600]
@low_tones  = [350, 430, 550]
@attack = @release = ms(10)


### 1st - slow cycles
play_sequence ms(400)

### interval between sequences
sleep 4

### 2st - fast cycles
play_sequence ms(100)
