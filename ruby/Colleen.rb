#!/usr/bin/env ruby
#Commentaire en dehors

QUINE = "#!/usr/bin/env ruby%{nl}#Commentaire en dehors%{nl}%{nl}QUINE = %{bq}%{quine}%{bq}%{nl}%{nl}if __FILE__ == $0%{nl}%{ht}puts QUINE %% {nl: 10.chr, ht: 9.chr, bq: 34.chr, quine: QUINE}%{nl}%{ht}#Commentaire dedans%{nl}end"

if __FILE__ == $0
  puts QUINE % {nl: 10.chr, ht: 9.chr,bq: 34.chr, quine: QUINE}
  #Commentaire dedans
end
