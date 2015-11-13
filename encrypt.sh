echo -n "$1" | gpg --encrypt --armor --keyring filter_plugins/.gnupg/pubring.gpg --recipient 'ansible@made.com' --no-version

#TODO: Parse the gpg output and return only what the user needs to copy
# For example if the encrypted gpg string is:
# -----BEGIN PGP MESSAGE-----
#
# hQEMA/GH7ZIk6/K8AQf+MyeX5lO4TWL7hX9ty0AGd7BJiJvy+x8uvi3QqyOC3+1M
# lp/kshJziTM3ACh9dsSarSqq619rIS6aqzJeFfFBs0dOchEVEYH8tn+9DQQXy6rE
# NuaTjh8LSXVkX9X4DzCDRJiFbUfxwdgQpyme5kFIjTE9uBG1vg7V3Dj6AuXoq6mn
# BMNSxPGrEsfSMXonnNhLPLTFACFdEkbjkPN3iKl8qa6nvSu27BhNa9ZxJRwqy3K2
# uL4mw5VkvYbtk5g7PaMjRg0Q3+EjmjvSAKIQ7Eh5rgKPfQclFZxpb+kn3zJIK6Li
# 7l/x4HXiVhC8HLI6B1KGNEhsEgO/Wo1WBKRz77NNcNJBAQdic/IQw9YvpLehOiPf
# yLgRFD8BFaUt2Zk+tIQpmY34s2bjgA79U2pyGiungOVHbzhzQbw2H9koeG63QRTm
# 7nA=
# =Vr3p
# -----END PGP MESSAGE-----

# take only that part:

# hQEMA/GH7ZIk6/K8AQf+MyeX5lO4TWL7hX9ty0AGd7BJiJvy+x8uvi3QqyOC3+1M
# lp/kshJziTM3ACh9dsSarSqq619rIS6aqzJeFfFBs0dOchEVEYH8tn+9DQQXy6rE
# NuaTjh8LSXVkX9X4DzCDRJiFbUfxwdgQpyme5kFIjTE9uBG1vg7V3Dj6AuXoq6mn
# BMNSxPGrEsfSMXonnNhLPLTFACFdEkbjkPN3iKl8qa6nvSu27BhNa9ZxJRwqy3K2
# uL4mw5VkvYbtk5g7PaMjRg0Q3+EjmjvSAKIQ7Eh5rgKPfQclFZxpb+kn3zJIK6Li
# 7l/x4HXiVhC8HLI6B1KGNEhsEgO/Wo1WBKRz77NNcNJBAQdic/IQw9YvpLehOiPf
# yLgRFD8BFaUt2Zk+tIQpmY34s2bjgA79U2pyGiungOVHbzhzQbw2H9koeG63QRTm
# 7nA=

# and also replace the new lines with \n so in the end will return that:

# hQEMA/GH7ZIk6/K8AQf+MyeX5lO4TWL7hX9ty0AGd7BJiJvy+x8uvi3QqyOC3+1M\nlp/kshJziTM3ACh9dsSarSqq619rIS6aqzJeFfFBs0dOchEVEYH8tn+9DQQXy6rE\nNuaTjh8LSXVkX9X4DzCDRJiFbUfxwdgQpyme5kFIjTE9uBG1vg7V3Dj6AuXoq6mn\nBMNSxPGrEsfSMXonnNhLPLTFACFdEkbjkPN3iKl8qa6nvSu27BhNa9ZxJRwqy3K2\nuL4mw5VkvYbtk5g7PaMjRg0Q3+EjmjvSAKIQ7Eh5rgKPfQclFZxpb+kn3zJIK6Li\n7l/x4HXiVhC8HLI6B1KGNEhsEgO/Wo1WBKRz77NNcNJBAQdic/IQw9YvpLehOiPf\nyLgRFD8BFaUt2Zk+tIQpmY34s2bjgA79U2pyGiungOVHbzhzQbw2H9koeG63QRTm\n7nA=