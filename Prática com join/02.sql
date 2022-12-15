SELECT 
	testimonials.id, 
	"p1".name AS "writer",
	"p2".name AS "recipient",
	message
	FROM testimonials 
JOIN users "p1" ON testimonials."writerId" = "p1".id
JOIN users "p2" ON testimonials."recipientId" = "p2".id;