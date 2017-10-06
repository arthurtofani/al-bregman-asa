# DEMONSTRATION 14
# Stream segregation of high and low bands of noise

use_bpm 60

def play_noise(f)
  use_synth (f==:high ? :noise : :bnoise)
  #use_synth :beep
  freq = { low: (50..100), high: (2000..4000) }[f]
  play hz_to_midi(freq.first), attack: ms(5), sustain: ms(50), release: ms(5)
  sleep ms(60)
end

def ms(duration_in_miliseconds)
  duration_in_miliseconds/1000.0
end



#### Global data
@attack = ms(20)
@release = ms(20)
@sustain =  ms(20)
@increment = 2.5
@interval = 140

52.times do
  play_noise(:high)
  sleep ms(@interval)

  play_noise(:low)
  sleep ms(@interval)

  play_noise(:high)
  sleep ms(@interval)

  sleep ms(60)
  sleep ms(@interval)

  @interval -= @increment
end
