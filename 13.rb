# DEMONSTRATION 13
# The effects of stream segregation on the judgment of timing
# see result in audios/13a.mp3

use_bpm 60
use_synth :beep


def play_note(freq)
  play hz_to_midi(freq), attack: @attack, sustain: @sustain, release: @release, amp: (@low_tones.include?(freq) ? 1.5 : 1)
  sleep @attack + @sustain + @release
end

def ms(duration_in_miliseconds)
  duration_in_miliseconds/1000.0
end

def play_sequence
  8.times do
    play_note @high_tone
    sleep ms(180)
  end

  10.times do
    play_note @high_tone
    sleep ms(60)
    play_note @low_tone
    sleep ms(60)
    play_note @high_tone
    sleep ms(180)
  end

end


#### Global data
@attack = ms(20)
@release = ms(20)
@sustain =  ms(20)


### Panel One
@high_tone = 1400
@low_tone  = 1350
2.times { play_sequence }


### Panel Two
@low_tone  = 600
2.times { play_sequence }
