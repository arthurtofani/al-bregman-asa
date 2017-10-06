# DEMONSTRATION 02 
# Pattern recognition, within and across perceptual streams


use_bpm 60
use_synth :beep


def play_note(freq, sustain)
  play hz_to_midi(freq), attack: @attack, sustain: sustain, release: @release, amp: (@low_tones.include?(freq) ? 1.5 : 1)
end

def ms(duration_in_miliseconds)
  duration_in_miliseconds/1000.0
end

def play_sequence
  5.times do
    @high_tones.each_with_index do |tone, i|
      play_note @high_tones[i], @sustain
      sleep @sustain * 2
    end
  end

  5.times do
    @high_tones.each_with_index do |tone, i|
      play_note @high_tones[i], @sustain
      sleep @sustain
      play_note @low_tones[i], @sustain
      sleep @sustain
    end
  end
end


#### Global data
@attack = @release = ms(10)
@sustain =  ms(100)


### 1st
@high_tones = [2500, 2000, 1600]
@low_tones  = [350, 430, 550]
2.times do
  play_sequence
end


### interval between sequences
sleep 4


### 2st
@high_tones = [2500, 350, 1600]
@low_tones  = [2000, 430, 550]
2.times do
  play_sequence
end
