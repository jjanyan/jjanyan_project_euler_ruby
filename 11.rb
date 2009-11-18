matrix = Array.new()
matrix[0] = Array.[]('08','02','22','97','38','15','00','40','00','75','04','05','07','78','52','12','50','77','91','08')
matrix[1] = Array.[]('49','49','99','40','17','81','18','57','60','87','17','40','98','43','69','48','04','56','62','00')
matrix[2] = Array.[]('81','49','31','73','55','79','14','29','93','71','40','67','53','88','30','03','49','13','36','65')
matrix[3] = Array.[]('52','70','95','23','04','60','11','42','69','24','68','56','01','32','56','71','37','02','36','91')
matrix[4] = Array.[]('22','31','16','71','51','67','63','89','41','92','36','54','22','40','40','28','66','33','13','80')
matrix[5] = Array.[]('24','47','32','60','99','03','45','02','44','75','33','53','78','36','84','20','35','17','12','50')
matrix[6] = Array.[]('32','98','81','28','64','23','67','10','26','38','40','67','59','54','70','66','18','38','64','70')
matrix[7] = Array.[]('67','26','20','68','02','62','12','20','95','63','94','39','63','08','40','91','66','49','94','21')
matrix[8] = Array.[]('24','55','58','05','66','73','99','26','97','17','78','78','96','83','14','88','34','89','63','72')
matrix[9] = Array.[]('21','36','23','09','75','00','76','44','20','45','35','14','00','61','33','97','34','31','33','95')
matrix[10] = Array.[]('78','17','53','28','22','75','31','67','15','94','03','80','04','62','16','14','09','53','56','92')
matrix[11] = Array.[]('16','39','05','42','96','35','31','47','55','58','88','24','00','17','54','24','36','29','85','57')
matrix[12] = Array.[]('86','56','00','48','35','71','89','07','05','44','44','37','44','60','21','58','51','54','17','58')
matrix[13] = Array.[]('19','80','81','68','05','94','47','69','28','73','92','13','86','52','17','77','04','89','55','40')
matrix[14] = Array.[]('04','52','08','83','97','35','99','16','07','97','57','32','16','26','26','79','33','27','98','66')
matrix[15] = Array.[]('88','36','68','87','57','62','20','72','03','46','33','67','46','55','12','32','63','93','53','69')
matrix[16] = Array.[]('04','42','16','73','38','25','39','11','24','94','72','18','08','46','29','32','40','62','76','36')
matrix[17] = Array.[]('20','69','36','41','72','30','23','88','34','62','99','69','82','67','59','85','74','04','36','16')
matrix[18] = Array.[]('20','73','35','29','78','31','90','01','74','31','49','71','48','86','81','16','23','57','05','54')
matrix[19] = Array.[]('01','70','54','71','83','51','54','69','16','92','33','48','61','43','52','01','89','19','67','48')

def get_product(matrix, x, y, x_direction, y_direction)
	return_result = Hash.new()
	return_result['product'] = 0
	x = x.to_i
	y = y.to_i
	# CHECK WE ARE LOOKING WITHIN THE MATRIX
	if ((x+(x_direction*3)) < 0) or ((x+(x_direction*3)) > (matrix.length-1)) or ((y+(y_direction*3)) < 0) or ((y+(y_direction*3)) > (matrix[x].length-1))
		return return_result
	end
	product = 1 
	pieces = Array.new()
	0.upto(3) { |num|
		product *= matrix[x+(x_direction*num)][y+(y_direction*num)].to_i
		pieces.push(matrix[x+(x_direction*num)][y+(y_direction*num)].to_i)
	}
	return_result['product'] = product
	return_result["pieces"] = pieces
	return return_result
end

answer = 0
directions = [-1,1,0]
matrix.each_index{ |i|
	matrix[i].each_index{ |j|
		directions.each { |x|
			directions.each{ |y|
				# IF WE'RE NOT LOOKING ANY DIRECTION, SKIP
				if x == 0 and y == 0
					break
				end
				result = get_product(matrix,i,j,x,y)
				if result['product'].to_i >= answer and result['product'].to_i > 0
					answer = result['product']
					puts result['pieces'].join(' * ').to_s+' = '+answer.to_s+"\t"+i.to_s+','+j.to_s
				end
			}
		}
	}
}
puts answer.to_s
