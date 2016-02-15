p1 = Professor.create(name: "Betim Cico")
p2 = Professor.create(name: "Flamur Thaqi")

Post.create(text: "Mbylle gojen", professor_id: p1.id, user_id: 1)
Post.create(text: "Cuno, dil jasht", professor_id: p2.id, user_id: 3)