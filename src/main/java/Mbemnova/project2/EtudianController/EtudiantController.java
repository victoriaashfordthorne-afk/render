package Mbemnova.project2.EtudianController;

import Mbemnova.project2.Model.Etudiant;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


import Mbemnova.project2.Model.Etudiant;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
@RestController

public class EtudiantController {

    @GetMapping("/etudiants")
    public List<Etudiant> getEtudiants(){
        return List.of(
                new Etudiant(1L,"Alice Nkomo" ,"Informatique"),
                new Etudiant(2L, "Bob Tchamda", "Reseaux"),
                new Etudiant(3L, "Carole Mbida", "Genie Civil"),
                new Etudiant(4L, "David Essama", "Informatique"));

    }
}




