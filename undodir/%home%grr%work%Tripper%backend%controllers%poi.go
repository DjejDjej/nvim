Vim�UnDo� L1Y�ؐ��|����iܦmj&�����V�B�g�   K                                 g�D    _�                             ����                                                                                                                                                                                                                                                                                                                                                             g�\     �                   �               5��                                           S      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             g�e     �               	"your_project/models"5��                         H                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             g�e     �               
	"/models"5��                         H                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             g�f     �               		"models"5��                         H                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             g�g     �               	"your_project/database"5��                         S                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             g�i     �               
	"-models"5��                        H                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             g�j     �               
	"/models"5��                         H                      �                        J                     5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                             g�m    �               	"our_project/database"5��                        Z                     5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                                             g��     �                 package controllers       import (   	"net/http"   	"github.com/gin-gonic/gin"   	"tripper/models"   	"tripper/database"   )       // Get all Points of Interest   func GetPOIs(c *gin.Context) {   "	var pois []models.PointOfInterest   	database.DB.Find(&pois)       	c.JSON(http.StatusOK, pois)   }       !// Create a new Point of Interest    func CreatePOI(c *gin.Context) {   	var poi models.PointOfInterest       )	// Bind the JSON input to the POI struct   /	if err := c.ShouldBindJSON(&poi); err != nil {   <		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})   		return   	}       	database.DB.Create(&poi)   	c.JSON(http.StatusOK, poi)   }    5��                                  J             5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                             g��    �                   �               5��                    ?                       a      5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                             g�    �                	"database/sql"5��                                                5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             g�y     �              ?   package controllers       import (   	"encoding/json"   	"net/http"   	"tripper/database"   	"tripper/models"   )       -// GetPOIs fetches all POIs from the database   6func GetPOIs(w http.ResponseWriter, r *http.Request) {   #	// Query the database for all POIs   v	rows, err := database.DB.Query("SELECT id, name, description, latitude, longitude, category FROM points_of_interest")   	if err != nil {   F		http.Error(w, "Error fetching POIs", http.StatusInternalServerError)   		return   	}   	defer rows.Close()       #	// Create a slice to hold the POIs   "	var pois []models.PointOfInterest       ;	// Iterate over the result set and populate the POIs slice   	for rows.Next() {    		var poi models.PointOfInterest   f		err := rows.Scan(&poi.ID, &poi.Name, &poi.Description, &poi.Latitude, &poi.Longitude, &poi.Category)   		if err != nil {   G			http.Error(w, "Error scanning POIs", http.StatusInternalServerError)   				return   		}   		pois = append(pois, poi)   	}       &	// Return the POIs as a JSON response   3	w.Header().Set("Content-Type", "application/json")    	json.NewEncoder(w).Encode(pois)   }       .// CreatePOI handles the creation of a new POI   8func CreatePOI(w http.ResponseWriter, r *http.Request) {   	var poi models.PointOfInterest       .	// Parse the request body into the POI struct   ,	err := json.NewDecoder(r.Body).Decode(&poi)   	if err != nil {   7		http.Error(w, "Invalid input", http.StatusBadRequest)   		return   	}       (	// Insert the new POI into the database   ]	query := `INSERT INTO points_of_interest (name, description, latitude, longitude, category)    .			  VALUES ($1, $2, $3, $4, $5) RETURNING id`   v	err = database.DB.QueryRow(query, poi.Name, poi.Description, poi.Latitude, poi.Longitude, poi.Category).Scan(&poi.ID)   	if err != nil {   E		http.Error(w, "Error creating POI", http.StatusInternalServerError)   		return   	}       ,	// Return the newly created POI with its ID   3	w.Header().Set("Content-Type", "application/json")   	json.NewEncoder(w).Encode(poi)   }    5��            ?                      R             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             g�}    �                   �               5��                    2                       �      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             g��    �                	"database/sql"5��                                                5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             g��     �              2   package controllers       import (   	"encoding/json"   	"net/http"   
	"strconv"   	"tripper/database"   	"tripper/models"   )       5// GetPOIs fetches POIs within the given bounding box   6func GetPOIs(w http.ResponseWriter, r *http.Request) {   )	// Parse query parameters for map bounds   ?	north, _ := strconv.ParseFloat(r.URL.Query().Get("north"), 64)   ?	south, _ := strconv.ParseFloat(r.URL.Query().Get("south"), 64)   =	east, _ := strconv.ParseFloat(r.URL.Query().Get("east"), 64)   =	west, _ := strconv.ParseFloat(r.URL.Query().Get("west"), 64)       3	// SQL query to fetch POIs within the bounding box   F	query := `SELECT id, name, description, latitude, longitude, category   			  FROM points_of_interest   %			  WHERE latitude BETWEEN $1 AND $2   %			  AND longitude BETWEEN $3 AND $4`       @	rows, err := database.DB.Query(query, south, north, west, east)   	if err != nil {   F		http.Error(w, "Error fetching POIs", http.StatusInternalServerError)   		return   	}   	defer rows.Close()       #	// Create a slice to hold the POIs   "	var pois []models.PointOfInterest       ;	// Iterate over the result set and populate the POIs slice   	for rows.Next() {    		var poi models.PointOfInterest   f		err := rows.Scan(&poi.ID, &poi.Name, &poi.Description, &poi.Latitude, &poi.Longitude, &poi.Category)   		if err != nil {   G			http.Error(w, "Error scanning POIs", http.StatusInternalServerError)   				return   		}   		pois = append(pois, poi)   	}       &	// Return the POIs as a JSON response   3	w.Header().Set("Content-Type", "application/json")    	json.NewEncoder(w).Encode(pois)   }    5��            2                      �             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             g��    �                   �               5��                    J                       	      5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             g�D     �       L           5��            K                      	             5��