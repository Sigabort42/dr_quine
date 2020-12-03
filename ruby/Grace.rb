#!/usr/bin/env ruby
#Commentaire

FILENAME = "Grace_kid.rb"

QUINE = "#!/usr/bin/env ruby%{nl}#Commentaire%{nl}%{nl}FILENAME = %{bq}Grace_kid.rb%{bq}%{nl}%{nl}QUINE = %{bq}%{quine}%{bq}%{nl}%{nl}File.open(FILENAME, 'w') do |f|%{nl}%{ht}f.puts QUINE %% {nl: 10.chr, ht: 9.chr, bq: 34.chr, quine: QUINE}%{nl}end"

File.open(FILENAME, 'w') do |f|
  f.puts QUINE % {nl: 10.chr, ht: 9.chr,bq: 34.chr, quine: QUINE}
end
