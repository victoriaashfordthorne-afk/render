package Mbemnova.project2.Model;

public class Etudiant {
    private Long id;
    private String nom;
    private String filirer;


    public Etudiant(Long id, String  nom, String filirer){
        this.id = id;
        this .nom = nom;
         this.filirer =filirer;

    }
    public Long getId() {return id;}
    public String getNom(){return nom;}
    public String getFilirer() {return filirer;}
}