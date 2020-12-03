#!/usr/bin/env ruby

I = 5 - 1

FILENAME = "Sully_" + I.to_s + ".rb"

QUINE = "#!/usr/bin/env ruby%{nl}%{nl}I = %{i} - 1%{nl}%{nl}FILENAME = %{bq}Sully_%{bq} + I.to_s + %{bq}.rb%{bq}%{nl}%{nl}QUINE = %{bq}%{quine}%{bq}%{nl}%{nl}if __FILE__ == $0%{nl}%{ht}if I >= 0%{nl}%{ht}%{ht}File.open(FILENAME, 'w', 0777) do |f|%{nl}%{ht}%{ht}%{ht}f.puts QUINE %% {nl: 10.chr, ht: 9.chr, bq: 34.chr, i: I, di: 35.chr, quine: QUINE}%{nl}%{ht}%{ht}end%{nl}%{ht}%{ht}`ruby %{di}{FILENAME}`%{nl}%{ht}end%{nl}end"

if __FILE__ == $0
  if I >= 0
       File.open(FILENAME, 'w', 0777) do |f|
         f.puts QUINE % {nl: 10.chr, ht: 9.chr, bq: 34.chr, i: I, di: 35.chr, quine: QUINE}
       end
       `ruby #{FILENAME}`
  end
end

