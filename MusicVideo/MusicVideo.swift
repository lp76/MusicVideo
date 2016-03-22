//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by Luca Peduto on 07/03/16.
//  Copyright © 2016 Eloquent Bit. All rights reserved.
//

import Foundation

class Videos {
    
    var vRank = 0
    
    private var _vName:String
    private var _vImageUrl:String
    private var _vVideoUrl:String
    private var _vRights:String
    private var _vPrice:String
    private var _vArtist:String
    private var _vImid:String
    private var _vGenre:String
    private var _vLinkToiTunes:String
    private var _vReleaseDate:String
    
    // This variable gets created from the UI
    var vImageData:NSData?
    
    // Make a getter
    
    var vName: String {
        return _vName
    }
    
    var vImageUrl: String {
        return _vImageUrl
    }
    
    var vVideoUrl: String {
        return _vVideoUrl
    }
    
    var vRights: String {
        return _vRights
    }
    
    var vPrice: String {
        return _vPrice
    }
    
    var vArtist: String {
        return _vArtist
    }
    
    var vImid: String {
        return _vImid
    }
    
    var vGenre: String {
        return _vGenre
    }
    
    var vLinkToiTunes: String {
        return _vLinkToiTunes
    }
    
    var vReleaseDate: String {
        return _vReleaseDate
    }
    
    init(data: JSONDictionary) {
        
        // Video name
        if let name = data["im:name"] as? JSONDictionary,
            vName = name["label"] as? String {
                self._vName = vName
        } else {
            _vName = ""
        }
        
        // The Video Image
        if let img = data["im:image"] as? JSONArray,
            image = img[2] as? JSONDictionary,
            immage = image["label"] as? String {
                _vImageUrl =
                    immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
        } else {
            _vImageUrl = ""
        }
        
        // Video Url
        if let video = data["link"] as? JSONArray,
            vUrl = video[1] as? JSONDictionary,
            vHref = vUrl["attributes"] as? JSONDictionary,
            vVideoUrl = vHref["href"] as? String {
                self._vVideoUrl = vVideoUrl
        } else {
            _vVideoUrl = ""
        }
        
        // Rights
        if let rights = data["rights"] as? JSONDictionary,
            vRights = rights["label"] as? String {
                self._vRights = vRights
        } else {
            _vRights = ""
        }
        
        // Price
        if let price = data["im:price"] as? JSONDictionary,
            vPrice = price["label"] as? String {
                self._vPrice = vPrice
        } else {
            _vPrice = ""
        }
        
        // Artist
        if let artist = data["im:artist"] as? JSONDictionary,
            vArtist = artist["label"] as? String {
                self._vArtist = vArtist
        } else {
            _vArtist = ""
        }
        
        // iMId
        if let imid = data["id"] as? JSONDictionary,
            attributes = imid["attributes"] as? JSONDictionary,
            id = attributes["im:id"] as? String {
                self._vImid = id
        } else {
            _vImid = ""
        }
        
        // Genre
        if let category = data["category"] as? JSONDictionary,
            attributes = category["attributes"] as? JSONDictionary,
            term = attributes["term"] as? String {
                self._vGenre = term
        } else {
            _vGenre = ""
        }
        
        // Itunes Link
        if let link = data["link"] as? JSONArray,
            vLink = link[1] as? JSONDictionary,
            attributes = vLink["attributes"] as? JSONDictionary,
            href = attributes["href"] as? String {
                self._vLinkToiTunes = href
        } else {
            _vLinkToiTunes = ""
        }
        
        // Release date
        if let relDate = data["im:releaseDate"] as? JSONDictionary,
            label = relDate["label"] as? String {
                self._vReleaseDate = label
        } else {
            _vReleaseDate = ""
        }
    }
    
}